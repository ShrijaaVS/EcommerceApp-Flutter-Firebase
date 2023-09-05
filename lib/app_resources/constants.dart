import 'package:flutter/material.dart';
const kmajortextStyle=TextStyle(fontFamily: 'Poppins',
  fontSize: 30,
  fontWeight: FontWeight.w900,
);
const kminortextStyle=TextStyle(fontFamily: 'Poppins',
  color: Colors.black45,
  fontSize: 15,
  fontWeight: FontWeight.w600
);

const kwelcomeStyle=TextStyle(fontFamily: 'Poppins',
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const klabelStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 15,
  fontWeight: FontWeight.w600,
);

const kloginbuttonStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 20,
  fontWeight: FontWeight.w700,
);
const kloginpagetext = TextStyle(fontFamily: 'Poppins',
    color: Colors.black45,
  fontSize: 15,
fontWeight: FontWeight.w600);

const kerrormsgStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 12,
  fontWeight: FontWeight.w600,
);
const ktextStyle=TextStyle(fontFamily: 'Poppins',
    color: Colors.black45,
    fontSize: 20,
    fontWeight: FontWeight.w600
);

const kcontainerStyle=TextStyle(fontFamily: 'Poppins',
    color: Colors.black45,
    fontSize: 13,
    fontWeight: FontWeight.w600
);
const kcontainerwidgetStyle=TextStyle(fontFamily: 'Poppins',
  fontSize: 35,
  fontWeight: FontWeight.w800,
);

const klabelsStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const kStyle=TextStyle(fontFamily: 'Poppins',
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

const kwidgetStyle=TextStyle(fontFamily: 'Poppins',
  color: Colors.black45,
  fontSize: 15,
  fontWeight: FontWeight.w800,
);

const kdetailsStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const kdeStyle=TextStyle(fontFamily: 'Poppins',
color: Colors.black45,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

const klabelSStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 15,
  fontWeight: FontWeight.w600,
);

final ksizeButtonPressedStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          // Text color when the button is pressed
          return kbuttonPressedtext;

        }
        // Default text color

        return kloginpagetext;
      },
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    shape:  MaterialStateProperty.all<CircleBorder>(
        const CircleBorder(
          side:BorderSide(color: Colors.black),
        )
    )
);

final ksizeButtonUnpressedStyle =ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),

    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          // Text color when the button is pressed
          return kbuttonPressedtext;
        }
        // Default text color
        return kloginpagetext;
      },
    ),
    shape:  MaterialStateProperty.all<CircleBorder>(
        const CircleBorder(
          side:BorderSide(color: Colors.grey),
        )
    )
);
const kbuttonPressedtext = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600
) ;

const ksizetextStyle=TextStyle(fontFamily: 'Poppins',
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const kdescStyle=TextStyle(fontFamily: 'Poppins',
    color: Colors.black45,
    fontSize: 15,
    fontWeight: FontWeight.w400,
);
const kaddStyle=TextStyle(fontFamily: 'Poppins',

  fontSize: 14,
  fontWeight: FontWeight.w400,
);
const kdesctextStyle=TextStyle(fontFamily: 'Poppins',
  color: Colors.black45,
  fontSize: 13,
  fontWeight: FontWeight.w400,
);
final kplusbuttonstyle =ButtonStyle(
    shape:  MaterialStateProperty.all<CircleBorder>(
        CircleBorder(
          side:BorderSide(color: Colors.grey.shade200),
          eccentricity: 1,
        )
    )
);