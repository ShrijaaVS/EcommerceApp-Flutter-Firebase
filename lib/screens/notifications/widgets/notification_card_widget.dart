
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, });

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 100.0,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        backgroundBlendMode: BlendMode.overlay,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 2),
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                 const SizedBox(width: 10.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fscreation',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: ' It is a long established fact\n',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                            'that a reader will be distracted by the\n'
                                'readable content of a page.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    const Text(
                      '2 hours ago',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
