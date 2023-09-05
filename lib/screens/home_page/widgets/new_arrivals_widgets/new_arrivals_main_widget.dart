import 'package:ecommerceapp/screens/home_page/widgets/new_arrivals_widgets/new_arrivals_widget.dart';
import 'package:flutter/material.dart';


class NewArrivalsPages extends StatefulWidget {
  const NewArrivalsPages({Key? key}) : super(key: key);

  @override
  State<NewArrivalsPages> createState() => NewArrivalsPagesState();
}

class NewArrivalsPagesState extends State<NewArrivalsPages> {
  final PageController _controller = PageController(initialPage: 0,viewportFraction: 0.5);
  double currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return
      SizedBox(
      height: 1000,
      width: 400,
      child:
        PageView(
            physics: const NeverScrollableScrollPhysics(),
            padEnds: false,
            scrollDirection: Axis.vertical,
            controller: PageController(viewportFraction: 0.3),
            children:
            const <Widget>[NewArrivals(),
              NewArrivals(),
              NewArrivals(),
            ]

        ),

    );
  }
}



