import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    shape: CircleBorder(),
    backgroundColor: Colors.white,
  );
}

ButtonStyle elevatedButtonStyle2() {
  return ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)));
}
