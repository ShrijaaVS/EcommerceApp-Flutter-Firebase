
import 'package:ecommerceapp/screens/login/login_bloc.dart';
import 'package:ecommerceapp/screens/login/login_state.dart';
import 'package:ecommerceapp/screens/login/widgets//phone_field_widget.dart';
import 'package:ecommerceapp/screens/login/widgets//otp_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceapp/screens/home_page/home_screen.dart';
import 'package:ecommerceapp/app_resources/lottie_animations.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => PhoneAuthPageState();
}

class PhoneAuthPageState extends State<PhoneAuthPage> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _codeController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child:
          BlocListener<PhoneAuthBloc, PhoneAuthState>(
            listener: (context, state) {
              // Phone Otp Verified. Send User to Home Screen
              if (state is PhoneAuthVerified) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              }

              // Show error message if any error occurs while verifying phone number and otp code
              if (state is PhoneAuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
              builder: (context, state) {
                if (state is PhoneAuthLoading) {
                  return Center(
                    child: buildPhoneOtpLoadingAnimation(),
                  );
                }

                if (state is! PhoneAuthCodeSentSuccess) {
                  return PhoneNumberWidget(
                    phoneNumberController: _phoneNumberController,
                  );
                } else {
                  return OtpWidget(
                    codeController: _codeController,
                    verificationId: state.verificationId,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
