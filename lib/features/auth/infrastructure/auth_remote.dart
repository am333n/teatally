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
      final google = GoogleSignIn();
      await google.signOut();
      final googleUser = await google.signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth != null) {
        final cred = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        return RemoteResponse.success(cred);
      } else {
        return const RemoteResponse.failure('Something went wrong');
      }
    } catch (e) {
      return RemoteResponse.failure(e);
    }
  }

  BaseReturnType signInWithCredential(AuthCredential credential) async {
    try {
      final response = await _firebaseAuth.signInWithCredential(credential);
      return RemoteResponse.success(response);
    } on FirebaseAuthException catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleFirebaseAuthException(e));
    } catch (e) {
      return RemoteResponse.failure(
          FailureHandler.handleGenericException(e as Exception));
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
    return super.addItem(
      Collections.users,
      userCred.toJson(),
      uniqueField: 'uid',
    );
  }
}
