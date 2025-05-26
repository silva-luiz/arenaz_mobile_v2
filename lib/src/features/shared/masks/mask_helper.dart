import 'package:flutter/services.dart';

class MaskHelper {
  static TextInputFormatter phoneFormatter() {
    return _PhoneInputFormatter();
  }

  static TextInputFormatter cepFormatter() {
    return _CepInputFormatter();
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
        if (text.length <= 2) {
          formatted = '($text';
        } else if (text.length <= 3) {
          formatted = '(${text.substring(0, 2)}) ${text.substring(2)}';
        } else if (text.length <= 7) {
          formatted =
              '(${text.substring(0, 2)}) ${text.substring(2, 3)} ${text.substring(3)}';
        } else {
          formatted =
              '(${text.substring(0, 2)}) ${text.substring(2, 3)} ${text.substring(3, 7)}-${text.substring(7, text.length <= 11 ? text.length : 11)}';
        }
      }

      int cursorPosition = newValue.selection.end;
      int offset = formatted.length;

      if (oldValue.text.length < newValue.text.length) {
        if (formatted.length == 3 && cursorPosition == 3) {
          offset = 3;
        } else if (formatted.length == 6 && cursorPosition == 6) {
          offset = 6;
        } else if (formatted.length == 8 && cursorPosition == 8) {
          offset = 8;
        } else if (formatted.length == 13 && cursorPosition == 13) {
          offset = 13;
        } else if (formatted.length > 13 &&
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

class _CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    String formatted = '';

    try {
      if (text.isNotEmpty) {
        if (text.length <= 5) {
          formatted = text;
        } else {
          formatted =
              '${text.substring(0, 5)}-${text.substring(5, text.length.clamp(5, 8))}';
        }
      }

      int cursorPosition = newValue.selection.end;
      int offset = formatted.length;

      if (oldValue.text.length < newValue.text.length) {
        if (formatted.length == 6 && cursorPosition == 6) {
          offset = 6; // após o traço
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
