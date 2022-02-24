part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  final User? user;
  const AppState({this.user});

  @override
  List<Object> get props => [];
}

// class IsLoggedInState extends AppState {
//   const IsLoggedInState();
//   // get current user
// }

class HomeLoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends AppState {
  const HomeLoadedState(this.habits);
  final List<HabitDetails> habits;
  @override
  List<Object> get props => [habits];
}

class CreateHabitState extends AppState {
  const CreateHabitState(this.habit);
  final List<HabitDetails> habit;

  @override
  List<Object> get props => [habit];
}

class ViewHabitState extends AppState {
  const ViewHabitState(this.habit);
  final List<HabitDetails> habit;

  @override
  List<Object> get props => [habit];
}

class ProfileViewState extends AppState {
  const ProfileViewState(this.user);
  final User user;
  @override
  List<Object> get props => [];
}

class ProfileEditState extends AppState {
  const ProfileEditState(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}
