import 'package:google_sign_in/google_sign_in.dart';


/// A service class to handle Google Sign In operations.
/// Implements singleton pattern to ensure single instance throughout the app.
class GoogleSignInService {
  static final GoogleSignInService _instance = GoogleSignInService._internal();
  late final GoogleSignIn _googleSignIn;

  // Private constructor
  GoogleSignInService._internal() {
    _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
  }

  // Factory constructor to return the singleton instance
  factory GoogleSignInService() {
    return _instance;
  }

  /// Signs in with Google and returns basic user data
  Future<BasicUserData?> signIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) return null;

      return BasicUserData(
        name: account.displayName ?? '',
        email: account.email,
      );
    } catch (error) {
      throw GoogleSignInException('Failed to sign in with Google: $error');
    }
  }

  /// Checks if a user is already signed in.
  /// Returns true if a user is signed in, false otherwise.
  Future<bool> isSignedIn() async {
    try {
      return await _googleSignIn.isSignedIn();
    } catch (error) {
      throw GoogleSignInException('Failed to check sign in status: $error');
    }
  }

  /// Signs out the current user.
  /// Returns null after successful sign out.
  /// Throws [GoogleSignInException] if the sign-out process fails.
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      throw GoogleSignInException('Failed to sign out: $error');
    }
  }

  /// Gets the currently signed-in account, if any.
  Future<GoogleSignInAccount?> getCurrentUser() async {
    try {
      return _googleSignIn.currentUser;
    } catch (error) {
      throw GoogleSignInException('Failed to get current user: $error');
    }
  }
}

/// Simple class to hold basic user data
class BasicUserData {
  final String name;
  final String email;

  BasicUserData({
    required this.name,
    required this.email,
  });
}

/// Custom exception for Google Sign In related errors
class GoogleSignInException implements Exception {
  final String message;
  GoogleSignInException(this.message);

  @override
  String toString() => message;
}
