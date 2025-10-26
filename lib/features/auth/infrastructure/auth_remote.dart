import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/notification_model.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/failure.dart' as f;
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';

@injectable
class AuthRemoteService with BaseFirebase {
  AuthRemoteService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  BaseReturnType signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return RemoteResponse.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleFirebaseAuthException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
    }
  }

  BaseReturnType signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      final googleSignIn = GoogleSignIn();

      // Don't force signOut — this causes auth instability sometimes
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return const RemoteResponse.failure('Sign-in cancelled by user');
      }

      final googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null || googleAuth.accessToken == null) {
        return const RemoteResponse.failure('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return RemoteResponse.success(credential);
    } catch (e) {
      return RemoteResponse.failure(
        FailureHandler.handleGenericException(e as Exception),
      );
    }
  }

  BaseReturnType signInWithCredential(AuthCredential credential) async {
    try {
      final response =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return RemoteResponse.success(response);
    } on FirebaseAuthException catch (e) {
      return RemoteResponse.failure(
        FailureHandler.handleFirebaseAuthException(e),
      );
    } catch (e) {
      return RemoteResponse.failure(
        FailureHandler.handleGenericException(e as Exception),
      );
    }
  }

  BaseReturnType signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const RemoteResponse.success(true);
    } on FirebaseAuthException catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleFirebaseAuthException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
    }
  }

  BaseReturnType setFcmInActive(String docId, NotificationModel notification) {
    return super
        .updateItem(Collections.notification, docId, notification.toJson());
  }

  BaseReturnType getUserNotification(String uid) {
    return super
        .getItemWhere(Collections.notification, field: 'userUID', value: uid);
  }

  BaseReturnType checkIfUserDataExist(String email) {
    return super.getAllItemsWhere(
      Collections.users,
      whereConditions: {'email': email},
    );
  }

  BaseReturnType updateUserData(UserData userData) {
    return super.updateItem(
      Collections.users,
      userData.docId,
      userData.toJson(),
    );
  }

  BaseReturnType addUserDetailsToFireStore(UserData userCred) async {
    try {
      const uniqueField = 'uid';
      final data = userCred.toJson();
      final collectionPath = Collections.users;

      // Check for uniqueness if needed
      if (uniqueField != null && data.containsKey(uniqueField)) {
        final querySnapshot = await firebaseFirestore
            .collection(collectionPath)
            .where(uniqueField, isEqualTo: data[uniqueField])
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          return const RemoteResponse.failure(
            f.Failure.serverError(message: '$uniqueField already exists.'),
          );
        }
      }

      final response =
          await firebaseFirestore.collection(collectionPath).add(data);

      return RemoteResponse.success({
        'docId': response.id,
      });
    } on FirebaseException catch (e) {
      return RemoteResponse.failure(FailureHandler.handleFirestoreException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
    }
  }
}
