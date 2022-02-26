// ignore_for_file: overridden_fields, annotate_overrides

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
  const HomeLoadedState();
  @override
  List<Object> get props => [];
}

class CreateHabitState extends AppState {
  const CreateHabitState();

  @override
  List<Object> get props => [];
}

class EditHabitState extends AppState {
  const EditHabitState();
  // final List<> habit;

  @override
  List<Object> get props => [];
}

class ViewHabitState extends AppState {
  const ViewHabitState();

  @override
  List<Object> get props => [];
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
