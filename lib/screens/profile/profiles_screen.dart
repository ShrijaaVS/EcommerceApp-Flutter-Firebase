
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/profile/widgets/profile_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class ProfileInfo {
  String profileName = '';
  String profileImage = '';
  String emailId = '';
}

class Profile extends StatefulWidget {
  final PageController pageController;

  Profile({Key? key, required this.pageController}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final ScrollController scrollController = ScrollController();
  ProfileInfo profile = ProfileInfo();

  Future<void> fetchSlideData() async {
    final snapshot = await firestore.collection('user-profile-details').get();
    setState(() {
      final doc = snapshot.docs.isNotEmpty ? snapshot.docs[0] : null;
      if (doc != null) {
        profile.profileImage = doc.get("profileImage");
        profile.profileName = doc.get("profileName");
        profile.emailId = doc.get("emailId");
      }
    });
  }

  @override
  void initState() {
    fetchSlideData();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 50.0;

    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
           SizedBox(height: MediaQuery.of(context).size.height/30),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Container(
              height: 100.0,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10.0,
                    spreadRadius: 0.5,
                    offset: const Offset(
                      -0.5,
                      -0.5,
                    ), // Adjust the offset to control the shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                              image: profile.profileImage.isNotEmpty
                                  ? NetworkImage(profile.profileImage)
                              as ImageProvider<Object>
                                  : const AssetImage('assets/images/image.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            profile.profileName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            profile.emailId,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      FloatingActionButton(
                        elevation: 0.0,
                        mini: true,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(
                          Icons.settings,
                          size: 25.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/2.22,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade200,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 25.0,
                  bottom: 20.0,
                  top: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetails(
                      iconData: Icons.person,
                      profileDetails: 'Personal Details',
                    ),
                    ProfileDetails(
                      iconData: Icons.shopping_bag,
                      profileDetails: 'My Order',
                    ),
                    ProfileDetails(
                      iconData: Icons.favorite,
                      profileDetails: 'My Favourites',
                    ),
                    ProfileDetails(
                      iconData: Icons.local_shipping_rounded,
                      profileDetails: 'Shipping Addresses',
                    ),
                    ProfileDetails(
                      iconData: Icons.credit_card,
                      profileDetails: 'My Cards',
                    ),
                    ProfileDetails(
                      iconData: Icons.settings,
                      profileDetails: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/4,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade200,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 25.0,
                  bottom: 20.0,
                  top: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetails(
                      iconData: Icons.error_rounded,
                      profileDetails: 'FAQs',
                    ),
                    ProfileDetails(
                      iconData: Icons.verified_user,
                      profileDetails: 'Privacy Policy',
                    ),
                    ProfileDetails(
                      iconData: Icons.verified_outlined,
                      profileDetails: 'Terms Of Use',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
