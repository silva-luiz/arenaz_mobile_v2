import 'package:flutter/services.dart';

class MaskHelper {
  static TextInputFormatter phoneFormatter() {
    return _PhoneInputFormatter();
  }
}

class _PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    String formatted = '';

    try {
      if (text.isNotEmpty) {
        // DDD (2 dígitos)
        if (text.length <= 2) {
          formatted = '($text';
        }
        // DDD + 1 dígito
        else if (text.length <= 3) {
          formatted = '(${text.substring(0, 2)}) ${text.substring(2)}';
        }
        // DDD + número (até 7 dígitos)
        else if (text.length <= 7) {
          formatted =
              '(${text.substring(0, 2)}) ${text.substring(2, 3)} ${text.substring(3)}';
        }
        // Número completo (8-11 dígitos)
        else {
          formatted =
              '(${text.substring(0, 2)}) ${text.substring(2, 3)} ${text.substring(3, 7)}-${text.substring(7, text.length <= 11 ? text.length : 11)}';
        }
      }

      // Mantém a posição do cursor
      int cursorPosition = newValue.selection.end;
      int offset = formatted.length;

      // Ajusta a posição do cursor quando estamos adicionando caracteres de formatação
      if (oldValue.text.length < newValue.text.length) {
        if (formatted.length == 3 && cursorPosition == 3)
          offset = 3; // Após "("
        else if (formatted.length == 6 && cursorPosition == 6)
          offset = 6; // Após ")"
        else if (formatted.length == 8 && cursorPosition == 8)
          offset = 8; // Após espaço
        else if (formatted.length == 13 && cursorPosition == 13)
          offset = 13; // Após espaço
        else if (formatted.length > 13 &&
            cursorPosition == formatted.indexOf('-') + 1) {
          offset = cursorPosition + 1;
        }
      }

      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: offset),
      );
    } catch (e) {
      return oldValue;
    }
  }
}
