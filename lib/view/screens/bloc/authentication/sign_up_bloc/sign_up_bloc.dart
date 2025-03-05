import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_shift/domain/model/user_model.dart';
import 'package:tech_shift/domain/repository/auth_repository.dart';
import 'package:tech_shift/infrastructure/exception_handler/auth_exception_handler.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonClickEvent>((event, emit) async {
      emit(SignUpLoading());
      String phoneNumber = event.userModel.phoneNumber;
      try {
        await AuthRepository.sendOtp(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Auto-retrieve the SMS code on Android devices.
            await FirebaseAuth.instance.signInWithCredential(credential);
            emit(SignUpSuccess(user: event.userModel));
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(SignUpFailure(
                message: AuthExceptionHandler.generateExceptionMessage(
                    AuthExceptionHandler.handleException(e))));
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            emit(SignUpOtpSent(
              verificationId: verificationId,
              forceResendingToken: forceResendingToken,
            ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-resolution timed out...
            print('Auto retrieval timeout: $verificationId');
          },
        );
      } on FirebaseAuthException catch (e) {
        emit(SignUpFailure(
            message: AuthExceptionHandler.generateExceptionMessage(
                AuthExceptionHandler.handleException(e))));
      } catch (e) {
        emit(SignUpFailure(message: "An exception occurred: ${e.toString()}"));
      }
    });
  }
}
