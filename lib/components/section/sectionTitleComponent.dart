import 'package:ecommerce/utils/font.dart';
import 'package:flutter/cupertino.dart';

Widget sectionTitleComponent(text) {
  return Container(
    margin: const EdgeInsets.only(left: 18, right: 12, top: 12, bottom: 7),
    child: Align(
      alignment: Alignment.topLeft,
      child: text != null
          ? Text(
              text,
              style: sectionTitleTextStyle,
            )
          : const SizedBox(),
    ),
  );
}
