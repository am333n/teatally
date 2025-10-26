import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CredentialStorage {
  // Keys
  static const String _keyDisplayName = 'displayName';
  static const String _keyEmail = 'email';
  static const String _keyIsEmailVerified = 'isEmailVerified';
  static const String _keyIsAnonymous = 'isAnonymous';
  static const String _keyCreationTime = 'creationTime';
  static const String _keyLastSignInTime = 'lastSignInTime';
  static const String _keyPhoneNumber = 'phoneNumber';
  static const String _keyPhotoURL = 'photoURL';
  static const String _keyUid = 'uid';
  static String fcmTokenKey = "fcmToken";

  /// Stores user data from [UserCredential].
  static Future<void> storeUser(UserCredential userCredential) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final user = userCredential.user;
    if (user != null) {
      await prefs.setString(_keyDisplayName, user.displayName ?? '');
      await prefs.setString(_keyEmail, user.email ?? '');
      await prefs.setBool(_keyIsEmailVerified, user.emailVerified);
      await prefs.setBool(_keyIsAnonymous, user.isAnonymous);
      await prefs.setString(_keyCreationTime,
          user.metadata.creationTime?.toIso8601String() ?? '');
      await prefs.setString(_keyLastSignInTime,
          user.metadata.lastSignInTime?.toIso8601String() ?? '');
      await prefs.setString(_keyPhoneNumber, user.phoneNumber ?? '');
      await prefs.setString(_keyPhotoURL, user.photoURL ?? '');
      await prefs.setString(_keyUid, user.uid);
    }
  }

  /// Retrieves user details from SharedPreferences.
  static Future<Map<String, dynamic>> retrieveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return {
      'displayName': prefs.getString(_keyDisplayName),
      'email': prefs.getString(_keyEmail),
      'isEmailVerified': prefs.getBool(_keyIsEmailVerified) ?? false,
      'isAnonymous': prefs.getBool(_keyIsAnonymous) ?? false,
      'creationTime': prefs.getString(_keyCreationTime),
      'lastSignInTime': prefs.getString(_keyLastSignInTime),
      'phoneNumber': prefs.getString(_keyPhoneNumber),
      'photoURL': prefs.getString(_keyPhotoURL),
      'uid': prefs.getString(_keyUid),
    };
  }

  static Future<String?> getDisplayName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyDisplayName);
  }

  static Future<bool> updateFcmToken({required String? token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(fcmTokenKey, token ?? '');
    return true;
  }

  static Future<String?> getFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fcmTokenKey);
  }

  static Future<Map<String, String?>> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final displayName = prefs.getString(_keyDisplayName);
    final email = prefs.getString(_keyEmail);
    final photoURL = prefs.getString(_keyPhotoURL);
    return {'displayName': displayName, "email": email, 'photoURL': photoURL};
  }

  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  // static Future<String?> getUid() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(_keyUid);
  // }

  static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_keyDisplayName);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyIsEmailVerified);
    await prefs.remove(_keyIsAnonymous);
    await prefs.remove(_keyCreationTime);
    await prefs.remove(_keyLastSignInTime);
    await prefs.remove(_keyPhoneNumber);
    await prefs.remove(_keyPhotoURL);
    await prefs.remove(_keyUid);
  }
}
