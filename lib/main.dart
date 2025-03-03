import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_shift/core/appthemes.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/firebase_options.dart';
import 'package:tech_shift/view/screens/user_side/login_screen/login_screen.dart';
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
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Tech Shift',
      darkTheme: Appthemes.darkTheme(),
      theme: Appthemes.lightTheme(),
      home: SplashScreen(),
    );
  }
}
