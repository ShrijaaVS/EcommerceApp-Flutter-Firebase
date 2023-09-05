// abstract class PhoneLoginEvent{}
// class PhoneLoginPressed extends PhoneLoginEvent{
//  // final String username;
//   //final String password;
//   final String phoneNumber;
//   PhoneLoginPressed({required this.phoneNumber});//required this.username,required this.password });
// }
//
// login_event.dart
// import 'package:equatable/equatable.dart';
//
// abstract class PhoneLoginEvent extends Equatable {
//   const PhoneLoginEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class PhoneLoginPressed extends PhoneLoginEvent {
//   final String phoneNumber;
//
//   const PhoneLoginPressed(this.phoneNumber);
//
//   @override
//   List<Object> get props => [phoneNumber];
// }
//
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneAuthEvent extends Equatable{
  const PhoneAuthEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SendOtpToPhoneEvent extends PhoneAuthEvent {
  final String phoneNumber;

  const SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
class VerifySentOtpEvent extends PhoneAuthEvent {
  final String otpCode;
  final String verificationId;

  const VerifySentOtpEvent(
      {required this.otpCode, required this.verificationId});

  @override
  List<Object> get props => [otpCode, verificationId];
}
class OnPhoneOtpSent extends PhoneAuthEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}
class OnPhoneAuthErrorEvent extends PhoneAuthEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}
class OnPhoneAuthVerificationCompleteEvent extends PhoneAuthEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}
