import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/onboarding/widgets/onboarding_screen_widgets.dart';
class Pagesmodel extends StatelessWidget{
  final ImageProvider image;
  final String majortext1;
  final String majortext2;
  final String minortext;
  const Pagesmodel({super.key,  required this.image,required this.majortext1,required this.majortext2,required this.minortext});
  @override
  Widget build(BuildContext context)
  {
    return  Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
      Pagewidgets(image: image,majortext1: majortext1, majortext2:majortext2,minortext: minortext),
    SizedBox(height: MediaQuery.of(context).size.height/6,),

    ]);
  }
}