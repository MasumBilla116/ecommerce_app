import 'package:flutter/material.dart';

const splashTime = 2;

// ----- Font Size ----
// Input
double inputLabelFontSize = 15;
double inputHintFontSize = 12;
// button
double buttonFontSize = 18;

// Shadow
//container
BoxShadow containerBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 3,
  blurRadius: 9,
  offset: const Offset(0, 3),
);

SizedBox spaceTopBottom = const SizedBox(height: 20);
SizedBox spaceTopBottomSectionTitle = const SizedBox(height: 10);

// button border radious
double buttonBorderRadious = 5;

// container margin
const EdgeInsets containerMarginLeftRight =
    EdgeInsets.only(left: 12, right: 12, top: 12);

// container border radious
const BorderRadius containerBorderRadious =
    BorderRadius.all(Radius.circular(12));
