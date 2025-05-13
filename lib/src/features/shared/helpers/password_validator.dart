class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe uma senha';
    }

    final password = value.trim();

    if (password.length < 8) {
      return 'A senha deve ter no mínimo 8 caracteres';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'A senha deve conter uma letra maiúscula';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'A senha deve conter uma letra minúscula';
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return 'A senha deve conter pelo menos um número';
    }

    if (!RegExp(r'[!@#\$&*~%^+=()\[\]{};:"\\|,.<>\/?_-]').hasMatch(password)) {
      return 'A senha deve conter um caractere especial';
    }

    return null;
  }
}
