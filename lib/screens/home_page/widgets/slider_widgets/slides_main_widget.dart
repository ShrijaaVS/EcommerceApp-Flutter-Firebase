
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/home_page/widgets/slider_widgets/slide_widget.dart';

class Slides extends StatefulWidget {
  const Slides({Key? key}) : super(key: key);

  @override
  State<Slides> createState() => SlidesState();
}

class SlidesState extends State<Slides> {
  final PageController _controller = PageController(initialPage: 0, viewportFraction: 0.5);
  double currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth * 0.9;
        final containerHeight = containerWidth * 0.5;

        return SizedBox(
          width: containerWidth,
          height: containerHeight,
          child: PageView(
            padEnds: false,
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.8),
            children: const <Widget>[
              SlidePageDesign(),
              SlidePageDesign(),
              SlidePageDesign(),
              SlidePageDesign(),
              SlidePageDesign(),
            ],
          ),
        );
      },
    );
  }
}
