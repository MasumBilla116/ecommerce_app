import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabComponent extends StatefulWidget {
  final width;
  final buttons;
  TabComponent({required this.width, required this.buttons, Key? key})
      : super(key: key);

  State<TabComponent> createState() => _TabComponent();
}

class _TabComponent extends State<TabComponent> {
  var activeTab = 0;
  void initState() {
    super.initState();
  }

  void tabHandler(tab) {
    setState(() {
      activeTab = tab;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // start buttons
        Container(
          width: widget.width,
          height: 30,
          decoration: BoxDecoration(
            color: Color.fromARGB(29, 0, 255, 8),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: baseColor, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    tabHandler(0);
                  },
                  child: Text(
                    Language.load("one_piece_price"),
                    style: TextStyle(
                        color: activeTab == 0 ? whiteColor : darkColor),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          activeTab == 0 ? baseColor : transparentColor),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    tabHandler(1);
                  },
                  child: Text(
                    Language.load("one_bundle_price"),
                    style: TextStyle(
                        color: activeTab == 1 ? whiteColor : darkColor),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          activeTab == 1 ? baseColor : transparentColor),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
            ],
          ),
        ),
        if (activeTab == 0) TabContent(widget.width, "1 PIECES 180"),
        if (activeTab == 1) TabContent(widget.width, "1 BUNDLE 1200"),
      ],
    );
  }
}

Widget TabContent(width, title) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          width: 1,
          color: Color.fromARGB(66, 158, 158, 158),
        ),
        borderRadius: BorderRadius.circular(5)),
    margin: const EdgeInsets.only(top: 15),
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: orangeColor),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
