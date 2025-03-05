import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_shift/core/enums/auth_results_status.dart';
import 'package:tech_shift/domain/model/user_model.dart';
import 'package:tech_shift/infrastructure/exception_handler/auth_exception_handler.dart';

class AuthRepository {
  static AuthResultStatus? _status;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static UserCredential? _userCredential;
  static Future<void> createAccount({required UserModel usemodel}) async {
    try {
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usemodel.phoneNumber, password: usemodel.password);
      if (_userCredential!.user != null) {
        print('User created successfully');
        _status = AuthResultStatus.successful;
      } else {
        print('User creation failed');
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
  }

  static Future<void> login({required UserModel usemodel}) async {
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usemodel.phoneNumber, password: usemodel.password);
      if (_userCredential!.user != null) {
        print('User logged in successfully');
        _status = AuthResultStatus.successful;
      } else {
        print('User login failed');
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @login: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      _status = AuthResultStatus.successful;
    } catch (e) {
      print('Exception @logout: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
  }

 static Future<void> sendOtp({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    try {
      print("Phone number is $phoneNumber");
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('Failed to send OTP: $e');
    }
  }
   static Future<bool> verifyEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload(); // Refresh user data to get the latest verification status
        return user.emailVerified;
      } else {
        return false; // User is not signed in
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('Failed to verify email: $e');
    }
  }
}
