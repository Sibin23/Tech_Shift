import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_shift/core/appthemes.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/firebase_options.dart';
import 'package:tech_shift/view/screens/bloc/authentication/sign_up_bloc/sign_up_bloc.dart';
import 'package:tech_shift/view/screens/bloc/cubit/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:tech_shift/view/screens/bloc/cubit/timer_cubit/timer_cubit.dart';
import 'package:tech_shift/view/screens/bloc/authentication/sign_in_bloc/sign_in_bloc.dart';
import 'package:tech_shift/view/screens/user_side/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => ConfirmPasswordVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        debugShowCheckedModeBanner: false,
        title: 'Tech Shift',
        darkTheme: Appthemes.darkTheme(),
        theme: Appthemes.lightTheme(),
        home: SplashScreen(),
      ),
    );
  }
}
