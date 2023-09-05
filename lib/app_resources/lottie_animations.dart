import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
Widget buildEmptyCartAnimation() {
  return Center(child:Column(
    children: [
      const SizedBox(height: 250.0,),
      SizedBox(
        height: 250,
        child: Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_0s6tfbuc.json',
          fit: BoxFit.contain,
        ),
      ),
      // const Text('Empty Cart',style: TextStyle(fontFamily: 'Poppins',
      //     color: Colors.black45,
      //     fontSize: 20,
      //     fontWeight: FontWeight.w600
      // ),
      // )

    ],
  )
  );
}

Widget buildPhoneOtpLoadingAnimation(){
  return Center(child:Column(
    children: [
      const SizedBox(height: 250.0,),
      SizedBox(
        height: 200,
        child: Lottie.network(
          'https://assets8.lottiefiles.com/private_files/lf30_esg1l8r1.json',
          fit: BoxFit.contain,
        ),
      ),

    ],
  )
  );
}

Widget loginSuccessfulPage(){

      return SizedBox(
        height: 200,
        child: Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_wdgc54qd.json',
          fit: BoxFit.contain,
        ),

  );
}
Widget orderSuccessfulPage(){

  return SizedBox(
    height: 400,
    child: Lottie.network(
      'https://assets7.lottiefiles.com/packages/lf20_waygllpi.json',
      fit: BoxFit.contain,
      repeat: false,
      frameRate: FrameRate(120)
    ),

  );
}