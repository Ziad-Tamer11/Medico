import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medico/core/errors/exceptions.dart';

class FirebaseAuthService {
  //create user with email and password
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(
          errMessage: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          errMessage: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          errMessage: 'Make sure you are connected to the internet.',
        );
      } else {
        throw CustomExceptions(
          errMessage: 'Something went wrong. Please try again.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomExceptions(
        errMessage: 'Something went wrong. Please try again.',
      );
    }
  }

  //sign in with email and password
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomExceptions(errMessage: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(errMessage: 'Invalid email or password.');
      } else if (e.code == 'invalid-credential') {
        throw CustomExceptions(errMessage: 'Invalid email or password.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          errMessage: 'Make sure you are connected to the internet.',
        );
      } else {
        throw CustomExceptions(
          errMessage: 'Something went wrong. Please try again.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomExceptions(
        errMessage: 'Something went wrong. Please try again.',
      );
    }
  }

  //sign in with google
  Future<User> signInWithGoogle() async {
    final googleUser = await GoogleSignIn.instance.authenticate();
    final googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return userCredential.user!;
  }
}
