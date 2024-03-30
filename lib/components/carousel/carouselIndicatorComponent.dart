import 'package:flutter/material.dart';
import "package:carousel_slider/carousel_slider.dart";

class CarouselIndicatorComponent extends StatefulWidget {
  final List<Widget> slideItems;
  CarouselIndicatorComponent(this.slideItems);
  @override
  State<CarouselIndicatorComponent> createState() =>
      _CarouselIndicatorComponent();
}

class _CarouselIndicatorComponent extends State<CarouselIndicatorComponent> {
  CarouselController carouselController = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.slideItems,
          options: CarouselOptions(
            // height: 150,
            initialPage: 0,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            reverse: false,
            // autoPlayInterval: const Duration(seconds: 3),
            // autoPlayAnimationDuration: const Duration(milliseconds: 800),
            // autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          carouselController: carouselController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.slideItems.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 20.0,
                height: 3.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _currentIndex == entry.key
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
