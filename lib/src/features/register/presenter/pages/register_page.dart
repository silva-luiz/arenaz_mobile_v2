import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:arenaz_mobile_v2/src/features/shared/helpers/password_validator.dart';
import 'package:arenaz_mobile_v2/src/features/shared/masks/mask_helper.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/buttons/generic_button.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/inputs/generic_input.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/inputs/password_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cellphoneController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController complementController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('As senhas não coincidem.')),
        );
        return;
      }
      Modular.to.pushNamed('/');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    cellphoneController.dispose();
    cepController.dispose();
    addressController.dispose();
    complementController.dispose();
    neighborhoodController.dispose();
    numberController.dispose();
    cityController.dispose();
    super.dispose();
  }

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Bem-vindo(a) ao ArenaZ',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.titleColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Para começar, preencha os campos abaixo:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        GenericInput(
                          hintText: 'Nome completo',
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Informe seu nome completo';
                            }
                            return null;
                          },
                        ),

                        GenericInput(
                          hintText: 'Celular',
                          controller: cellphoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                            MaskHelper.phoneFormatter(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe um número de celular';
                            }
                            if (value.replaceAll(RegExp(r'\D'), '').length !=
                                11) {
                              return 'Número de celular inválido';
                            }
                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'E-mail',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Informe um e-mail';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                        ),
                        PasswordInput(
                          hintText: 'Escolha uma senha',
                          controller: passwordController,
                          validator: PasswordValidator.validate,
                        ),
                        PasswordInput(
                          hintText: 'Digite novamente a senha',
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirme sua senha';
                            }
                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'CEP',
                          controller: cepController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                            MaskHelper.cepFormatter(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            final numericCep = value.replaceAll(
                              RegExp(r'\D'),
                              '',
                            );
                            if (numericCep.length != 8) {
                              return 'Digite um CEP válido.';
                            }
                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'Rua',
                          controller: addressController,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe seu endereço.';
                            }

                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'Complemento',
                          controller: complementController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }

                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'Número',
                          controller: numberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }

                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'Bairro',
                          controller: neighborhoodController,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe seu endereço.';
                            }

                            return null;
                          },
                        ),
                        GenericInput(
                          hintText: 'Cidade',
                          controller: cityController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe sua cidade.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        GenericButton(
                          label: 'Criar conta',
                          onPressed: _submitForm,
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 24),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Já possui cadastro? ',
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.titleColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Ir para login',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Modular.to.pushNamed('/');
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
      ),
    );
  }
}
