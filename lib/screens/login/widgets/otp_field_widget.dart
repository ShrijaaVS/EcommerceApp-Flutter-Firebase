import 'package:ecommerceapp/screens/login/login_bloc.dart';
import 'package:ecommerceapp/screens/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceapp/app_resources/constants.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget(
      {Key? key, required this.codeController, required this.verificationId})
      : super(key: key);
  final TextEditingController codeController;
  final String verificationId;
  final GlobalKey<FormState> _otpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return
    SafeArea(
      child: Scaffold(
        body: Form(
          key: _otpFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 270.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/photo8.jpg.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 210,
                      width: 350,
                    ),
                  ],
                ),
                const SizedBox(height: 70.0),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Text(
                    "Enter your OTP",
                    style: kwelcomeStyle,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: _otpField(),
                ),
                const SizedBox(height: 330.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.0,
                      width: 380.0,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: FloatingActionButton.extended(
                          enableFeedback: true,
                          backgroundColor: Colors.black,
                          onPressed: () async {
                            HapticFeedback.lightImpact();
                            if (_otpFormKey.currentState!.validate()) {
                              if (_otpFormKey.currentState!.validate()) {
                                _verifyOtp(context: context);
                              }
                            }
                          },
                          label: const SizedBox(
                            child: Text(
                              'Login',
                              style: kloginbuttonStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpField() {
    return TextFormField(
      style: klabelStyle,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: true,
      obscuringCharacter: '*',
      controller: codeController,
      validator: (value) {
        if (value!.length != 6) {
          return 'Please enter valid OTP';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }



  void _verifyOtp({required BuildContext context}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
        otpCode: codeController.text, verificationId: verificationId));
    codeController.clear();
  }
}