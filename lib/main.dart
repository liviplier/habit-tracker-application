import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_tracker/app_routes.dart';
import 'package:habit_tracker/cubit/auth_cubit.dart';
import 'package:habit_tracker/screens/forms/forgot_password_screen.dart';
import 'package:habit_tracker/screens/forms/login_screen.dart';
import 'package:habit_tracker/screens/forms/signup_screen.dart';
import 'package:habit_tracker/screens/main_screen.dart';
import 'package:habit_tracker/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ,
        initialRoute: AppRoutes.welcome,
        routes: <String, WidgetBuilder>{
          AppRoutes.welcome: (_) => WelcomeScreen(),
          AppRoutes.login: (_) => const LoginScreen(),
          AppRoutes.signup: (_) => const SignUpScreen(),
          AppRoutes.forgotPassword: (_) => const ForgotPasswordScreen(),
          AppRoutes.main: (_) => const MainScreen(),
        },
      ),
    );
  }
}
