part of 'phone_auth_cubit.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthErrorState extends PhoneAuthState {
  final String errorMessage;

  const PhoneAuthErrorState({required this.errorMessage});

}
class PhoneAuthLoadingState extends PhoneAuthState {}

class PhoneNumberSubmittedState extends PhoneAuthState {}

class PhoneOtpVerifiedState extends PhoneAuthState {}

