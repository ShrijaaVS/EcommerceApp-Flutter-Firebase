
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final String profileDetails;
  final IconData iconData;

  const ProfileDetails({
    Key? key,
    required this.profileDetails,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final double availableWidth = MediaQuery.of(context).size.width - 70.0;

    return SizedBox(
      height: 60.0,
      width: availableWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              profileDetails,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 13.0,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
