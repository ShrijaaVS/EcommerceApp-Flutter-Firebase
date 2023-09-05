import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_resources/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'repositories/login/phone_auth_repository.dart';
import 'screens/login/login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Initialize Firebase
  await Firebase.initializeApp(
    name: 'name-here',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set Firebase locale
  FirebaseAuth.instance.setLanguageCode("en-US");


  // Initialize Firebase services
  FirebaseAuth.instance.useAuthEmulator('localhost', 52488);
  FirebaseAppCheck.instance.activate();
  // Other Firebase service initializations...

  // Initialize ScreenUtil
   Stripe.publishableKey = "pk_test_51NThzISBJWXcAA3NE5FXF09FqzyVMWkXwyC7wwqvGdWOd10AxEjjBpASDGSGwT0z4RZ1Pjk17TxspbGe269q9yW400kkLT7esI";

  //Load our .env file that contains our Stripe Secret key
    dotenv.load(fileName: "assets/.env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(  const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(375, 812), // Replace with your design size
      builder:  (context,child){return Provider<PhoneAuthBloc>(
        create: (_) => PhoneAuthBloc(phoneAuthRepository: PhoneAuthRepository()),
        child:  const MaterialApp(
          debugShowCheckedModeBanner: false,

          home: OnboardingScreen(),
        ),
      );
      }
    );
  }
}



