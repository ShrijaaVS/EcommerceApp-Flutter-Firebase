import 'package:flutter/material.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
class Onboarding{
  String onboardingImage='';
  Onboarding({required this.onboardingImage});
}

class Pagewidgets extends StatelessWidget{
  // List<Onboarding> images=[];
   final ImageProvider image;
   final String majortext1;
   final String majortext2;
   final String minortext;
   var size=const Size(0, 0);
   var height=0.0;
   var width=0.0;

  // Future<void> fetchSlideDataProducts() async {
  //   final snapshot = await firestore.collection('onboarding-screens').get();
  //   setState(() {
  //     images= snapshot.docs.map((doc) {
  //       final image = doc.get('onboardingImage') as String;
  //
  //
  //       return Onboarding(onboardingImage: image
  //       );
  //     }).toList();
  //   });
  // }
   Pagewidgets({super.key,  required this.image,required this.majortext1,required this.majortext2,required this.minortext});
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
     // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            ClipPath(

              child:Container(
              decoration: BoxDecoration(

                  image: DecorationImage(image: image,fit: BoxFit.fill),
                  borderRadius:  const BorderRadius.all(Radius.circular(40.0)),

              ),
              //margin:  const EdgeInsets.all(10),
              height: height/2,
              width: width*0.9,
            ),),
          ],
        ),
   SizedBox(height: MediaQuery.of(context).size.height/20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

    Padding(padding:const EdgeInsets.only(left: 10.0),child:Column(children: [Text(majortext1,style: kmajortextStyle,),
              Text(majortext2,style: kmajortextStyle,) ],),),
       SizedBox(height: MediaQuery.of(context).size.height/80),
            Padding(padding:const EdgeInsets.only(left: 20.0),child:Text(minortext,style: kminortextStyle,maxLines: 2,overflow: TextOverflow.clip,) ,),
          ],
        ),


      ],
    );

  }
}