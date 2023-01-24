import 'package:flutter/material.dart';

const LinearGradient purpleGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      purple,
      green,
    ]);

List<BoxShadow>? boxShadow = [
  const BoxShadow(
    color: purpleShadow,
    blurRadius: 5,
    offset: Offset(1, -1),
  )
];

const Color green = Color(0xFF5EE7B5);
const Color greenDarker = Color(0xFF57D4A6);
const Color redWarning = Color(0xFFFF4F6E);
const Color purple = Color(0xFF755EE7);
const Color purpleShadow = Color(0x3E755EE7);
const Color purpleSplashRipple = Color(0x18755EE7);

const Color white = Color(0xFFFFFFFF);
const Color grey = Color(0xFF666666);
const Color greyShadow = Color(0x3E666666);
const Color greyBackground = Color(0x18000000);
const Color dark = Color(0xFF3D3D3D);
