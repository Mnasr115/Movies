
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    //print('(verificationCompleted');
    await signIn(phoneAuthCredential);
  }

  void verificationFailed(FirebaseAuthException error) {
    //print('(verificationFailed : ${error.toString()}');
    emit(PhoneAuthErrorState(errorMessage: error.toString()));
  }

  void codeSent(String verificationId, int? forceResendingToken) {
//print('(codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmittedState());

  }

  void codeAutoRetrievalTimeout(String verificationId) {
    //print('(codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpCode,);

    await signIn(credential); 
  }
  
  Future<void> signIn(PhoneAuthCredential credential) async {
    try {

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerifiedState());
    }
    catch(error)
    {
      emit(PhoneAuthErrorState(errorMessage: error.toString(),),);
    }
    
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
     
  }



}
