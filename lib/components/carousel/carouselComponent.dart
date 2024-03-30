import 'package:flutter/material.dart';
import "package:carousel_slider/carousel_slider.dart";

class CarouselComponent extends StatefulWidget {
  final List<Widget> slideItems;
  CarouselComponent(this.slideItems);
  @override
  State<CarouselComponent> createState() => _CarouselComponentState();
}

class _CarouselComponentState extends State<CarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.slideItems
          .map((item) => Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: item,
                ),
              ))
          .toList(),
      options: CarouselOptions(
          height: 150,
          aspectRatio: 16 / 9,
          viewportFraction: .75,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          scrollDirection: Axis.horizontal,
          animateToClosest: true,
          clipBehavior: Clip.antiAlias),
    );
  }
}
