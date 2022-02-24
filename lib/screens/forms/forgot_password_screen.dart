import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/cubit/auth_cubit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthForgotPasswordError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.err!),
                  backgroundColor: Colors.red,
                ));

              if (state is AuthForgotPasswordSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                    content: Text("Reset link has been sent to your email"),
                    backgroundColor: Colors.green,
                  ));
                Navigator.of(context).pop();
              }
            }
          },
          builder: (context, state) {
            if (state is AuthDefault) {
              return _buildForgotPasswordScreen();
            } else if (state is AuthForgotPasswordLoading) {
              return loader();
            } else if (state is AuthForgotPasswordSuccess) {
              _buildForgotPasswordScreen();
            } else {
              return _buildForgotPasswordScreen();
            }
            return _buildForgotPasswordScreen();
          },
        ),
      ),
    );
  }

  Widget _buildForgotPasswordScreen() {
    return SafeArea(
      child: FormBuilder(
        autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
                const Image(
                  image: AssetImage("assets/images/logo.jpg"),
                  height: 200,
                  width: 200,
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
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final authCubit = BlocProvider.of<AuthCubit>(context);
                        await authCubit.forgotPassword(
                            formKey.currentState!.fields['email']?.value);
                      }
                    },
                    child: const Text("Send Link")),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loader() {
    return const Center(
      child: CircularProgressIndicator(),
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
