import 'package:flutter/material.dart';

Widget TextCircleAvater(title) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: CircleAvatar(
        maxRadius: 16,
        backgroundColor: Colors.white,
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
