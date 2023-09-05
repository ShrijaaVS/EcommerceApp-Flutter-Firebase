// // abstract class PhoneLoginState{}
// // class LoginInitial extends PhoneLoginState{}
// // class LoginLoading extends PhoneLoginState{}
// // class LoginSuccess extends PhoneLoginState{}
// // class ErrorState extends PhoneLoginState{
// //   final String error;
// //   ErrorState({required this.error});
// // }
// // login_state.dart
// import 'package:equatable/equatable.dart';
//
// abstract class PhoneLoginState extends Equatable {
//   const PhoneLoginState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoginInitial extends PhoneLoginState {}
//
// class LoginLoading extends PhoneLoginState {}
//
// class OtpCodeSent extends PhoneLoginState {
//   final String verificationId;
//
//   const OtpCodeSent({required this.verificationId});
//
//   @override
//   List<Object> get props => [verificationId];
// }
//
// class OtpAutoRetrievalTimeout extends PhoneLoginState {
//   final String verificationId;
//
//   const OtpAutoRetrievalTimeout({required this.verificationId});
//
//   @override
//   List<Object> get props => [verificationId];
// }
//
// class OtpAutoVerified extends PhoneLoginState {}
//
// class ErrorState extends PhoneLoginState {
//   final String error;
//
//   const ErrorState({required this.error});
//
//   @override
//   List<Object> get props => [ error];
// }

import 'package:equatable/equatable.dart';

abstract class PhoneAuthState extends Equatable{
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}
class PhoneAuthInitial extends PhoneAuthState {}
class PhoneAuthLoading extends PhoneAuthState {}
class PhoneAuthError extends PhoneAuthState {
  final String error;

   const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}
class PhoneAuthVerified extends PhoneAuthState {}
class PhoneAuthCodeSentSuccess extends PhoneAuthState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}
