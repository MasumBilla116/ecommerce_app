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
              color: whiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    tabHandler(0);
                  },
                  child: Text(
                    "1 PIECES PRICE",
                    style: TextStyle(
                        color: activeTab == 0 ? whiteColor : darkColor),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          activeTab == 0 ? greenColor : transparentColor),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    tabHandler(1);
                  },
                  child: Text(
                    "1 BUNDLE PRICE",
                    style: TextStyle(
                        color: activeTab == 1 ? whiteColor : darkColor),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          activeTab == 1 ? greenColor : transparentColor),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
            ],
          ),
        ),
        if (activeTab == 0) TabContent(widget.width),
        if (activeTab == 1) TabContent(widget.width),
      ],
    );
  }
}

Widget TabContent(width) {
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
        const Row(
          children: [
            Text(
              "1 PIECES 550/- TK ",
              style: TextStyle(fontWeight: FontWeight.bold, color: orangeColor),
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
