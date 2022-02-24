import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/app_routes.dart';
import 'package:habit_tracker/cubit/auth_cubit.dart';
import 'package:habit_tracker/screens/main_screen.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.errorMessage!),
                ));

              if (state is AuthLoginSuccess) {
                formKey.currentState!.reset();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainScreen()));
              }
            }
          },
          builder: (context, state) => _buildLoginScreen(),
        ),
      ),
    );
  }

  Widget _buildLoginScreen() {
    return SafeArea(
      child: FormBuilder(
        autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/logo.jpg"),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.next,
                    name: "email",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(context,
                          errorText: "Enter a valid email address")
                    ]),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter email",
                        hintStyle: kHintStyle,
                        filled: true,
                        fillColor: AppColors.mainColor.withOpacity(0.5),
                        enabledBorder: kOutlineBorder,
                        focusedBorder: kOutlineBorder,
                        errorBorder: kErrorOutlineBorder,
                        focusedErrorBorder: kErrorOutlineBorder),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.done,
                    name: "password",
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter password",
                        hintStyle: kHintStyle,
                        filled: true,
                        fillColor: AppColors.mainColor.withOpacity(0.5),
                        enabledBorder: kOutlineBorder,
                        focusedBorder: kOutlineBorder,
                        errorBorder: kErrorOutlineBorder,
                        focusedErrorBorder: kErrorOutlineBorder,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.radio_button_off
                                : Icons.radio_button_checked,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final authCubit = BlocProvider.of<AuthCubit>(context);
                      await authCubit.login(
                          formKey.currentState!.fields['email']?.value,
                          formKey.currentState!.fields['password']?.value);
                    }
                  },
                  child: BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoginLoading) {
                        return kLoaderBtn;
                      } else {
                        return const Text("Login");
                      }
                    },
                    listener: (context, state) {},
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: const Text("Forgot Password?"),
                ),
                const Divider(
                  height: 20,
                  endIndent: 10,
                  indent: 8,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text("Create an account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const kHintStyle = TextStyle(fontSize: 13, letterSpacing: 1.2);

var kOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);

var kErrorOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.red),
);

const kLoaderBtn = SizedBox(
  height: 20,
  width: 20,
  child: CircularProgressIndicator(
    strokeWidth: 1.5,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
);
