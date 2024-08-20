import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> registerUser(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors here if necessary
      rethrow; // Passes the error up the call stack
    } catch (e) {
      // Handle general errors
      rethrow;
    }
  }

  Future<UserCredential> loginUser(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors here if necessary
      rethrow;
    } catch (e) {
      // Handle general errors
      rethrow;
    }
  }


  Future<void> storeUserData(String uid, String fullName, String email) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Handle errors during Firestore operations
      rethrow;
    }
  }

  /// Logs out the currently authenticated user
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle logout errors
      rethrow;
    }
  }
}
