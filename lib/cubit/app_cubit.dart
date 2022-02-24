import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/habit_detail.dart';

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

  Future editHabit(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  Future viewProfile(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  Future editProfile(String uid, String hid) async {
    emit(HomeLoadingState());
    try {} on FirebaseAuthException catch (e) {}
  }

  detailScreen(HabitDetails) {
    emit(HomeLoadedState(HabitDetails));
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

