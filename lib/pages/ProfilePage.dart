import 'package:ecommerce/components/appbar/zeroAppBar.dart';
import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileButtonIconsList = [listIcon, loveIcon, messageIcon];

  final profileButtonTextList = ["my_order", "my_wishlist", 'message'];
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
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _boxWidget(context, "in_your_cart", '0'),
                      _boxWidget(context, "in_your_wishlist", '10'),
                      _boxWidget(context, "in_you_ordered", '19'),
                    ],
                  ),
                ),

                // list
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(48, 0, 0, 0),
                        offset: Offset(0, 8),
                        blurRadius: 8,
                        spreadRadius: .3,
                      ),
                    ],
                  ),
                  child: Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        leading: profileButtonIconsList[index],
                        title:
                            Text(Language.load(profileButtonTextList[index])),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: Color.fromARGB(88, 158, 158, 158),
                      ),
                      itemCount: 3,
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

Widget _boxWidget(BuildContext context, String label_key, String count) {
  return Container(
    height: 65,
    width: MediaQuery.of(context).size.width / 3.4,
    padding: const EdgeInsets.only(
      left: 8,
      right: 8,
      top: 5,
    ),
    decoration: const BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(92, 0, 0, 0),
          offset: Offset(0, 1.5),
          blurRadius: 5,
          spreadRadius: .3,
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          count,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(Language.load(label_key)),
      ],
    ),
  );
}
