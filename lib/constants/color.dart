import 'package:flutter/material.dart';

const LinearGradient purpleGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      purple,
      green,
    ]);

List<BoxShadow>? purpleBoxShadow = [
  const BoxShadow(
    color: purpleShadow,
    blurRadius: 5,
    offset: Offset(1, -1),
  )
];

List<BoxShadow>? greyBoxShadow = [
  const BoxShadow(
    color: greyLowOpacityBackground,
    blurRadius: 3,
    offset: Offset(1, 2),
  )
];

const Color green = Color.fromARGB(255, 90, 223, 174);
const Color greenDarker = Color.fromARGB(255, 84, 207, 162);
const Color redWarning = Color(0xFFFF4F6E);
const Color purple = Color(0xFF755EE7);
const Color purpleShadow = Color(0x3E755EE7);
const Color purpleSplashRipple = Color(0x18755EE7);

const Color white = Color(0xFFFFFFFF);
const Color grey = Color(0xFF666666);
const Color greyShadow = Color(0x3E666666);
const Color greyLowOpacityBackground = Color(0x18000000);
const Color dark = Color(0xFF3D3D3D);
const Color darkBackground = Color.fromARGB(255, 59, 59, 59);
