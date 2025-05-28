import '../../../shared/colors/colors.dart';
import '../../../shared/helpers/password_validator.dart';
import '../../../shared/masks/mask_helper.dart';
import '../../../shared/widgets/buttons/generic_button.dart';
import '../../../shared/widgets/inputs/generic_input.dart';
import '../../../shared/widgets/inputs/password_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final viewmodel = RegisterViewmodel();
  final _cepFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _cepFocusNode.addListener(() {
      if (!_cepFocusNode.hasFocus && viewmodel.cep.length == 8) {
        viewmodel.fetchAddressByCep(viewmodel.cep);
      }
    });
  }

  @override
  void dispose() {
    _cepFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (!viewmodel.isConfirmPasswordValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('As senhas não coincidem.')),
        );
        return;
      }

      final success = await viewmodel.registerUser();
      if (success && mounted) {
        Modular.to.pushNamed('/');
      } else if (viewmodel.errorMessage != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewmodel.errorMessage!)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Observer(
        builder: (_) => Stack(
          children: [
            _buildFormContent(),
            if (viewmodel.isLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Container(
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
                      // Nome completo
                      GenericInput(
                        hintText: 'Nome completo',
                        onChanged: viewmodel.setName,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Informe seu nome completo'
                            : value.length < 3
                                ? 'Nome muito curto'
                                : null,
                      ),
                      const SizedBox(height: 16),
                      
                      // Celular
                      GenericInput(
                        hintText: 'Celular',
                        keyboardType: TextInputType.phone,
                        onChanged: viewmodel.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                          MaskHelper.phoneFormatter(),
                        ],
                        validator: (value) {
                          final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                          if (digits.length != 11) return 'Número de celular inválido';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      // Email
                      GenericInput(
                        hintText: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: viewmodel.setEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Informe um e-mail';
                          if (!viewmodel.isEmailValid) return 'E-mail inválido';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      // Senha
                      PasswordInput(
                        hintText: 'Escolha uma senha',
                        validator: PasswordValidator.validate,
                        onChanged: viewmodel.setPassword,
                      ),
                      const SizedBox(height: 16),
                      
                      // Confirmação de senha
                      Observer(
                        builder: (_) => PasswordInput(
                          hintText: 'Digite novamente a senha',
                          onChanged: viewmodel.setConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Confirme sua senha';
                            if (!viewmodel.isConfirmPasswordValid) return 'As senhas não coincidem';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Título da seção de endereço
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Endereço',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.titleColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // CEP
                      GenericInput(
                        hintText: 'CEP',
                        keyboardType: TextInputType.number,
                        focusNode: _cepFocusNode,
                        onChanged: viewmodel.setCep,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(8),
                          MaskHelper.cepFormatter(),
                        ],
                        validator: (value) {
                          final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                          if (digits.length != 8) return 'Digite um CEP válido';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      // Rua (preenchido automaticamente pelo CEP)
                      Observer(
                        builder: (_) => GenericInput(
                          hintText: 'Rua',
                          controller: TextEditingController(text: viewmodel.address),
                          focusNode: _addressFocusNode,
                          onChanged: viewmodel.setAddress,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Informe o endereço'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Número
                      GenericInput(
                        hintText: 'Número',
                        keyboardType: TextInputType.number,
                        onChanged: viewmodel.setNumber,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Informe o número'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      
                      // Complemento
                      GenericInput(
                        hintText: 'Complemento (opcional)',
                        onChanged: viewmodel.setComplement,
                      ),
                      const SizedBox(height: 16),
                      
                      // Bairro (preenchido automaticamente pelo CEP)
                      Observer(
                        builder: (_) => GenericInput(
                          hintText: 'Bairro',
                          controller: TextEditingController(text: viewmodel.neighborhood),
                          onChanged: viewmodel.setNeighborhood,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Informe o bairro'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Cidade (preenchido automaticamente pelo CEP)
                      Observer(
                        builder: (_) => GenericInput(
                          hintText: 'Cidade',
                          controller: TextEditingController(text: viewmodel.city),
                          onChanged: viewmodel.setCity,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Informe a cidade'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Estado (preenchido automaticamente pelo CEP)
                      Observer(
                        builder: (_) => GenericInput(
                          hintText: 'Estado',
                          controller: TextEditingController(text: viewmodel.state),
                          onChanged: viewmodel.setState,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Informe o estado'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Botão de cadastro
                      Observer(
                        builder: (_) => GenericButton(
                          label: 'Criar conta',
                          onPressed: viewmodel.isFormValid ? _submitForm : null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Link para login
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Modular.to.pushNamed('/'),
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