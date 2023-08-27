import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muteverse_flutter_app/common/loading_page.dart';
import 'package:muteverse_flutter_app/constants/constants.dart';
import 'package:muteverse_flutter_app/common/common.dart';
import 'package:muteverse_flutter_app/features/auth/view/login_view.dart';
import '../../../theme/pallete.dart';
import '../controller/auth_controller.dart';
import '../widgets/auth_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const SignUpView(),
  );
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appbar,
        body: isLoading ? const Loader() : Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // textfield 1
                  AuthField(controller: emailController, hintText: "Email"),
                  const SizedBox(
                    height: 25,
                  ),
                  // textfield 2
                  AuthField(controller: passwordController, hintText: "Password"),
                  const SizedBox(
                    height: 25,
                  ),
                  // button
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: onSignUp,
                      label: "Done",
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // textspan
                  RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: const TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                LoginView.route(),
                              );
                            },
                          text: " Log In",
                          style: const TextStyle(
                              fontSize: 14, color: Pallete.blueColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
