import 'package:ecommerce/components/appbar/zeroAppBar.dart';
import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        appBar: zeroAppbar(),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                // user profile
                Container(
                  padding: const EdgeInsets.all(12),
                  color: baseColor,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage("assets/images/profile/profile.jpg"),
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
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              color: whiteColor, fontWeight: FontWeight.bold),
                        ),
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor:
                                MaterialStatePropertyAll(orangeColor)),
                      )
                    ],
                  ),
                ),
                // order info
                Container(
                  color: baseColor,
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: whiteColor,
                          child: Text("Order"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
