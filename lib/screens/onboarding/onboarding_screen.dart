
import 'package:ecommerceapp/screens/home_page/home_screen.dart';
// import 'package:ecommerceapp/screens/login/phone_login_implementation/phone_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ecommerceapp/screens/login/login_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/screens/onboarding/widgets/onboarding_screen_main_widget.dart';
import '../../repositories/login/phone_auth_repository.dart';



FirebaseFirestore firestore = FirebaseFirestore.instance;

class Onboarding {
  String onboardingImage = '';
  String heading1="";String heading12="";String heading2="";String heading21="";String heading3="";String heading31="";
  String desc="";
}

PageController _controller = PageController(initialPage: 0, viewportFraction: 1);
double currentPage = 0;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, });

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.zero,
        // only(
        //   left: ScreenUtil().setWidth(10),
        //   right: ScreenUtil().setWidth(10),
        //   top: ScreenUtil().setHeight(10),
        //   bottom: ScreenUtil().setHeight(10),
        // ),
        child: Scaffold(
          body:
          const PageViewOnboard(),

          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom:25.0 ),
            child: FloatingActionButton(
              enableFeedback: true,
              onPressed: () {
                HapticFeedback.mediumImpact();
                if (currentPage != 2) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RepositoryProvider(
                        create: (context) => PhoneAuthRepository(),
                          child: const HomePage(),
                      ),
                    ),
                  );
                }
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: const Icon(FontAwesomeIcons.caretRight),
            ),
          ),
        ),
      ),
    );
  }
}

class PageViewOnboard extends StatefulWidget {
  const PageViewOnboard({Key? key});

  @override
  State<PageViewOnboard> createState() => PageViewOnboardState();
}

class PageViewOnboardState extends State<PageViewOnboard> {
  Onboarding images = Onboarding();


  Future<void> fetchImages() async {
    final snapshot = await firestore.collection('onboarding-screens').get();
    setState(() {
      final doc = snapshot.docs.isNotEmpty ? snapshot.docs[0] : null;
      if (doc != null) {
      images.onboardingImage = doc.get('onboardingImage') as String;
      images.desc=doc.get('desc') as String;
      images.heading1=doc.get('heading1') as String;
      images.heading12=doc.get('heading12') as String;
      images.heading2=doc.get('heading2') as String;
      images.heading21=doc.get('heading21') as String;
      images.heading3=doc.get('heading3') as String;
      images.heading31=doc.get('heading31') as String;
      }

    });
  }

  @override
  void initState() {
    fetchImages();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page.toDouble();
            });
          },
          children: <Widget>[
            Pagesmodel(
              image: images.onboardingImage.isNotEmpty
                  ? NetworkImage(images.onboardingImage) as ImageProvider<Object>
                  : const AssetImage('assets/images/photo4.jpg'),
              majortext1: images.heading1,
              majortext2: images.heading12,
              minortext: images.desc,
            ),
            Pagesmodel(
              image: images.onboardingImage.isNotEmpty
                  ? NetworkImage(images.onboardingImage) as ImageProvider<Object>
                  : const AssetImage('assets/images/photo4.jpg'),
              majortext1: images.heading2,
              majortext2: images.heading21,
              minortext: 'Publish up your selfies to make yourself more beautiful with this app',
            ),
            Pagesmodel(
              image: images.onboardingImage.isNotEmpty
                  ? NetworkImage(images.onboardingImage) as ImageProvider<Object>
                  : const AssetImage('assets/images/photo4.jpg'),
              majortext1: images.heading3,
              majortext2: images.heading31,
              minortext: images.desc,
            ),
          ],
        ),
        Positioned(
          bottom: ScreenUtil().setHeight(40),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(280),
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage,
            decorator: DotsDecorator(
              activeColor: Colors.black,
              activeSize: Size(ScreenUtil().setWidth(12), ScreenUtil().setWidth(12)),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.elliptical(ScreenUtil().setWidth(100), ScreenUtil().setHeight(90)),
                  right: Radius.elliptical(ScreenUtil().setWidth(100), ScreenUtil().setHeight(90)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}