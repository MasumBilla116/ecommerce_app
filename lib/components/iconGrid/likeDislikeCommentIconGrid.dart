import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

String formatCount(int count) {
  if (count < 1000) {
    return count.toString();
  } else if (count < 1000000) {
    double kCount = count / 1000;
    return '${kCount.toStringAsFixed(kCount.truncateToDouble() == kCount ? 0 : 1)}k';
  } else {
    double mCount = count / 1000000;
    return '${mCount.toStringAsFixed(mCount.truncateToDouble() == mCount ? 0 : 1)}M';
  }
}

Widget likeDislikeCommentGrid(icon, count) {
  return Row(
    children: [
      Icon(
        icon,
        color: baseColor,
      ),
      const SizedBox(width: 5),
      Text(formatCount(count)),
    ],
  );
}
