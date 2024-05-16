import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatefulWidget {
  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/profile/profile.jpg"),
        ),
        const SizedBox(
          width: 12,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Zoe Alexa",
                style: TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "zoealexa@gmail.com",
                style: TextStyle(fontSize: 12, color: whiteColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
