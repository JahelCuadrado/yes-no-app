import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFE0E0E0);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    })
    : assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'selectedColor must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }

}