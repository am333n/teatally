import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/constants.dart';
import 'package:teatally/core/infrastructure/base_firebase.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/core/injection/injection.dart';

@injectable
class AuthRemoteService with BaseFirebase {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteService(this._firebaseAuth);

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
      final googleUser = await GoogleSignIn().signIn();
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

  User? checkUserSigned() {
    return _firebaseAuth.currentUser;
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

  BaseReturnType addUserDetailsToFireStore(UserCredential userCred) {
    return super.addItem(
        Collections.users,
        {
          'email': userCred.user?.email,
          'displayName': userCred.user?.displayName,
          'uid': userCred.user?.uid,
          'photoURL': userCred.user?.photoURL
        },
        uniqueField: 'uid');
  }
}
