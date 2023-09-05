import 'package:ecommerceapp/screens/login/login_bloc.dart';
import 'package:ecommerceapp/screens/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerceapp/app_resources/constants.dart';
class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key, required this.phoneNumberController})
      : super(key: key);
  final TextEditingController phoneNumberController;

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {

  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
        body: Form(
          key: _phoneNumberFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(
                      height: 270.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/photo8.jpg.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // margin: const EdgeInsets.all(10),
                        height: 210,
                        width: 350,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/50),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Text(
                    "Welcome!",
                    style: kwelcomeStyle,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/60),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Text(
                    "Please login or signup to continue into our app",
                    style: kloginpagetext,
                  ),
                ),
               SizedBox(height:  MediaQuery.of(context).size.height/30,),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0,bottom: 10.0),
                  child: Text(
                    'Phone Number',
                    style: kwelcomeStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: _phonenumberField(),
                ),
                SizedBox(height:  MediaQuery.of(context).size.height/3.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:MediaQuery.of(context).size.height/15,//60.0
                      width: 380.0,
                      child: _loginButton(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),);
    }
  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    final phoneNumberWithCode = phoneNumber;
    context.read<PhoneAuthBloc>().add(
      SendOtpToPhoneEvent(
        phoneNumber: phoneNumberWithCode,
      ),
    );
    setState(() {
      widget.phoneNumberController.clear();
    });
  }
  Widget _phonenumberField(){
    return Column(children:[TextFormField(
      style: klabelStyle,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: widget.phoneNumberController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter your phone number',

      ),
      validator: (value) {
        if (value!.length != 10 || value.startsWith(RegExp(r'[6-9]')) == false) {
          return 'Please enter valid phone number';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
    ],
    );
    }
  Widget _loginButton() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () async {
          HapticFeedback.lightImpact();
          if (_phoneNumberFormKey.currentState!.validate()) {
            _sendOtp(
                phoneNumber: widget.phoneNumberController.text,
                context: context);
          }
    },
        label: const Text(
          'Send OTP',
          style: kloginbuttonStyle,
        ),
      ),
    );}

}