import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithDotNavigator extends StatefulWidget {
  const CarouselWithDotNavigator(
      {super.key, this.height = 320, required this.items, this.padding});
  final double height;
  final List<Widget> items;
  final EdgeInsetsGeometry? padding;

  @override
  State<CarouselWithDotNavigator> createState() =>
      _CarouselWithDotNavigatorState();
}

class _CarouselWithDotNavigatorState extends State<CarouselWithDotNavigator> {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                enlargeCenterPage: false,
                height: double.infinity,
                onPageChanged: (index, _) {
                  setState(() => currentIndex = index);
                },
              ),
              items: widget.items,
            ),
          ),
          const SizedBox(height: 8),
          if (widget.items.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.items.length, (index) => index)
                  .map((index) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    width: index == currentIndex ? 35.0 : 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          index == currentIndex ? 4.0 : 6.0),
                      color: index == currentIndex ? Colors.black : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            )
        ],
      ),
    );
  }
}
