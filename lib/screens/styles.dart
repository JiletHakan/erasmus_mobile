import 'package:flutter/material.dart';

class AppStyles {
  static ThemeData appTheme = ThemeData(
    primaryColor: Colors.blue, // Örnek olarak mavi tema rengi
    colorScheme: const ColorScheme.dark().copyWith(
      background:
          const Color.fromARGB(255, 235, 153, 31), // General background color
    ),
  );
}

class ButtonStyles {
  static ButtonStyle pressedButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // when clicked the button color
            return Colors.red;
          }
          // Button color
          return Colors.black;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return Colors.white;
        },
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
