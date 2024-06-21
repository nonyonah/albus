import 'package:albus/core/services/auth_exceptions/signup_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/home');
    }
  }

  Future<void> createUserWithEmail(String email) async {
    Get.toNamed('/password', arguments: {'email': email});
  }

  Future<void> createUserWithPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      final ex = SignUpException.code(e.code);
      Fluttertoast.showToast(msg: ex.message);
    } catch (e) {
      Fluttertoast.showToast(msg: "An unknown error occurred.");
    }
  }

  Future<void> signInWithEmail(String email) async {
    Get.toNamed('/password', arguments: {'email': email});
  }

  Future<void> signInWithPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      final ex = SignUpException.code(e.code);
      Fluttertoast.showToast(msg: ex.message);
    } catch (e) {
      Fluttertoast.showToast(msg: "An unknown error occurred.");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
