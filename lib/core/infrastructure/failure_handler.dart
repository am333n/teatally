import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'failure.dart';

class FailureHandler {
  /// Handles Firebase Authentication exceptions.
  ///
  ///

  static const Failure dataConversionFailure = Failure.serverError(
    message:
        'An error occurred while processing the data. Please try again later.',
  );

  static Failure handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const Failure.firebaseAuthError(
          message: 'The email address is not valid.',
          code: 'invalid-email',
        );
      case 'user-disabled':
        return const Failure.firebaseAuthError(
          message: 'The user account has been disabled.',
          code: 'user-disabled',
        );
      case 'user-not-found':
        return const Failure.firebaseAuthError(
          message: 'No user found with this email.',
          code: 'user-not-found',
        );
      case 'wrong-password':
        return const Failure.firebaseAuthError(
          message: 'Incorrect password entered.',
          code: 'wrong-password',
        );
      case 'network-request-failed':
        return const Failure.firebaseNetworkError(
          message: 'Network error. Please check your connection.',
          code: 'network-request-failed',
        );
      case 'invalid-credential':
        return const Failure.firebaseAuthError(
          message: 'Invalid Credentials, please enter correct credentials',
          code: 'invalid-credential',
        );
      default:
        return Failure.firebaseUnknownError(
          message: 'An unknown error occurred: ${e.message}',
          code: e.code,
        );
    }
  }

  /// Handles Firestore exceptions.
  static Failure handleFirestoreException(FirebaseException e) {
    switch (e.code) {
      case 'not-found':
        return const Failure.clientError(
          message: 'The requested document was not found.',
        );
      case 'permission-denied':
        return const Failure.noPermission();
      case 'deadline-exceeded':
        return const Failure.serverError(
          message: 'The operation timed out. Please try again later.',
        );
      case 'unavailable':
        return const Failure.firebaseNetworkError(
          message: 'The Firestore service is currently unavailable.',
        );
      case 'already-exists':
        return const Failure.clientError(
          message: 'The document already exists.',
        );
      case 'data-loss':
        return const Failure.serverError(
          message: 'Data loss occurred. Please contact support.',
        );
      case 'cancelled':
        return const Failure.serverError(
          message: 'The operation was cancelled.',
        );
      default:
        return Failure.firebaseUnknownError(
          message: 'An unknown Firestore error occurred: ${e.message}',
          code: e.code,
        );
    }
  }

  /// Handles generic exceptions, including Firebase Authentication and Firestore.
  static Failure handleGenericException(dynamic e) {
    if (e is FirebaseAuthException) {
      return handleFirebaseAuthException(e);
    } else if (e is FirebaseException) {
      return handleFirestoreException(e);
    } else if (e is NetworkException) {
      return const Failure.noInternet();
    } else if (e is PermissionException) {
      return const Failure.noPermission();
    } else if (e is PlatformException) {
      return Failure.clientError(message: e.message ?? 'Something went wrong');
    } else if (e is TypeError) {
      return Failure.clientError(message: 'Something went wrong : type error');
    } else {
      return Failure.serverError(
        message: 'An unexpected server error occurred: ${e.toString()}',
      );
    }
  }

  static String getErrorMessageFromFailure(Failure failure) {
    return failure.when(
      serverError: (errorMsg) =>
          'Server Error: $errorMsg. Please try again later.',
      clientError: (errorMsg) =>
          'Client Error: $errorMsg. Please check your request and try again.',
      noInternet: () =>
          'No Internet Connection: Please check your network and try again.',
      noPermission: () =>
          'Permission Denied: Please grant the necessary permissions to proceed.',
      firebaseAuthError: (errorMsg, code) =>
          'Authentication Error: $errorMsg${code != null ? " (Code: $code)" : ""}. Please try again.',
      firebaseNetworkError: (errorMsg, code) =>
          'Network Error with Firebase: $errorMsg${code != null ? " (Code: $code)" : ""}. Please try again.',
      firebaseUnknownError: (errorMsg, code) =>
          'Unknown Firebase Error: $errorMsg${code != null ? " (Code: $code)" : ""}. Please contact support if the issue persists.',
    );
  }
}

// Define any custom exceptions if needed
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class PermissionException implements Exception {
  final String message;
  PermissionException(this.message);
}
