// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthDefault());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

// login method
  Future login(String email, String password) async {
    emit(const AuthLoginLoading());
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      // login success
      if (user != null) {
        emit(AuthLoginSuccess(user: user));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthLoginError(error: e.message!));
    }
  }

  //  signup method
  Future signUp(String email, String password, String name) async {
    emit(const AuthSignUpLoading());
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        user.updateDisplayName(name);
        emit(const AuthSignUpSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthSignUpError(e.message));
    }
  }

  // forgot password method
  Future forgotPassword(String email) async {
    emit(const AuthForgotPasswordLoading());
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      emit(const AuthForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthForgotPasswordError(e.message));
    }
  }

  // google auth

  Future googleAuth() async {
    emit(const AuthGoogleLoading());
    try {
      final GoogleSignInAccount? _googleUser = await googleSignIn.signIn();
      if (_googleUser != null) {
        emit(AuthDefault());
      } else {
        final GoogleSignInAuthentication googleAuth =
            await _googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        User? user = (await firebaseAuth.signInWithCredential(credential)).user;
        if (user != null) {
          emit(AuthGoogleSuccess(user: user));
        }
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthGoogleError(error: e.toString()));
    }
  }

  Future googleLogout() async {
    await googleSignIn.signOut();
    emit(const AuthLogout());
  }

  // auth logout
  Future logout() async {
    await firebaseAuth.signOut();
    emit(const AuthLogout());
  }

  Future getCurrentUser() async {
    return await firebaseAuth.currentUser!;
  }
}
