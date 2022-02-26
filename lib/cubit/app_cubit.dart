// ignore_for_file: empty_catches, unused_catch_clause

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppCubit(appStateHomeState) : super(appStateHomeState);

  Future home(String uid, String hid) async {
    emit(HomeLoadingState());
    // try {
    //   if () {
    //     emit();
    //   }
    // } on FirebaseAuthException catch (e) {}
  }

  Future viewHabit(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  Future editHabit(String name, bool often, bool perDay, bool? perWeek,
      bool timeOfDay) async {
    emit(HomeLoadingState());
    try {
      // emit();
    } on FirebaseAuthException catch (e) {
      // emit(); display error
    }
  }

  Future viewProfile(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  Future editProfile(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  detailScreen() {
    emit(const HomeLoadedState());
  }
}

  // Future completedHabit(String uid, String hid) async {
  //   emit(HomeLoadingState());
  //   try {} on FirebaseAuthException catch (e) {}
  // }
  // Future removeHabit(String uid, String hid) async {
  //   emit(HomeLoadingState());
  //   try {} on FirebaseAuthException catch (e) {}
  // }

