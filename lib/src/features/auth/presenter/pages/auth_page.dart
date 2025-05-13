import 'package:arenaz_mobile_v2/src/features/auth/presenter/widgets/google_auth_button.dart';
import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/buttons/generic_button.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/inputs/generic_input.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/inputs/password_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.secondaryColor, AppColors.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                color: AppColors.defaultWhite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/arenaz_logo.png',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'ArenaZ',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.titleColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Jogue onde quiser!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.titleColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      GenericInput(
                        hintText: 'E-mail',
                        controller: loginController,
                      ),
                      PasswordInput(
                        hintText: 'Senha',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 24),
                      GenericButton(
                        label: 'Entrar',
                        onPressed: () {
                          Modular.to.pushNamed('/home');
                        },
                      ),
                      const SizedBox(height: 20),
                      GoogleAuthButton(
                        onPressed: () {
                          // Autenticação com Google
                          print('Login com Google');
                        },
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Ainda não conta? ',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.titleColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'Crie uma agora!',
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Modular.to.pushNamed('/register');
                                    },
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
        ),
      ),
    );
  }
}
