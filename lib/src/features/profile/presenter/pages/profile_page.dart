import '../widgets/avatar_widget.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/helpers/password_validator.dart';
import '../../../shared/widgets/buttons/generic_button.dart';
import '../../../shared/widgets/drawer/generic_drawer.dart';
import '../../../shared/widgets/inputs/generic_input.dart';
import '../../../shared/widgets/inputs/password_input.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: 'Papi da Silva');
  final _emailController = TextEditingController(text: 'teste@gmail.com');
  final _addressController = TextEditingController(
    text: 'Rua Teste, 123, Taubaté',
  );
  final _passwordController = TextEditingController(text: 'P@ssw0rd');

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Lógica para salvar perfil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alterações salvas com sucesso!')),
      );
    }
  }

  void _changeProfilePicture() {
    // Lógica para selecionar nova foto de perfil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.defaultWhite,
        backgroundColor: AppColors.secondaryColor,
        title: const Text(
          'Perfil de usuário',
          style: TextStyle(color: AppColors.defaultWhite),
        ),
      ),
      drawer: GenericDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AvatarWidget(onTap: _changeProfilePicture,
                userName: _nameController.text,
                userEmail: _emailController.text,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(thickness: 1.0, color: AppColors.gray),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dados cadastrais',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mantenha sempre seus dados atualizados.',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GenericInput(
                hintText: 'Nome completo',
                controller: _nameController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite seu nome'
                            : null,
              ),
              GenericInput(
                hintText: 'E-mail',
                isEnabled: false,
                controller: _emailController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite seu nome'
                            : null,
              ),
              GenericInput(
                controller: _addressController,
                hintText: 'Endereço',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite seu endereço'
                            : null,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(thickness: 1.0, color: AppColors.gray),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alterar senha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sua senha deve conter 8 caracteres, um número, uma letra maíuscula, uma letra minúscula e um caractere especial (!@#\$%&*).',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              PasswordInput(
                controller: _passwordController,
                hintText: 'Nova Senha',
                validator: PasswordValidator.validate,
              ),
              const SizedBox(height: 32),
              GenericButton(
                onPressed: _saveProfile,
                label: 'Salvar alterações',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
