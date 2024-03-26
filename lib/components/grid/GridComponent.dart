import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget gridComponent() {
  return GridView.count(
    crossAxisCount: 2,
    children: [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.red,
      ),
    ],
  );
}
