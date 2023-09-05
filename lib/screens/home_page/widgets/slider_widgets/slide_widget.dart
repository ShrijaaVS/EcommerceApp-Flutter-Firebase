
import 'package:flutter/material.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SlidePageDesign extends StatefulWidget {
  const SlidePageDesign({Key? key}) : super(key: key);

  @override
  _SlidePageDesignState createState() => _SlidePageDesignState();
}

class _SlidePageDesignState extends State<SlidePageDesign> {
  String imageUrl = '';
  String discountText = '';
  String discountDuration = '';
  String discountCode = '';

  @override
  void initState() {
    super.initState();
    fetchSlideData();
  }

  Future<void> fetchSlideData() async {
    final snapshot = await firestore.collection('carousel-slider').get();
    final doc = snapshot.docs.isNotEmpty ? snapshot.docs[0] : null;
    if (doc != null) {
      setState(() {
        imageUrl = doc.get("imageUrl");
        discountCode = doc.get("discountCode");
        discountDuration = doc.get("discountDuration");
        discountText = doc.get("discountText");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth * 0.95;
        final containerHeight = containerWidth * 0.6;

        return Row(
          children: [
            Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl) as ImageProvider<Object>
                      : const AssetImage('assets/images/phoyo20.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey[350],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discountCode,
                      style: kcontainerwidgetStyle,
                    ),
                    Text(
                      discountDuration,
                      style: klabelStyle,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      discountText,
                      style: kcontainerStyle,
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      height: 40.0,
                      child: FloatingActionButton.extended(
                        heroTag: null,
                        backgroundColor: Colors.black,
                        label: const Text(
                          'Get Now',
                          style: klabelStyle,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
