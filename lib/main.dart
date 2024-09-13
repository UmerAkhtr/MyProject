import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:pawbuddy/UI/screens/auth/forget_password/forget_password_screen.dart';
import 'package:pawbuddy/UI/screens/auth/login_screen/login_screen.dart';
import 'package:pawbuddy/UI/screens/auth/signup_screen/signup_screen.dart';
import 'package:pawbuddy/UI/screens/dailyTask.dart';
import 'package:pawbuddy/UI/screens/productsList.dart';
import 'package:pawbuddy/UI/screens/home_screen/home_screen.dart';
import 'package:pawbuddy/UI/screens/pet_adoption.dart';
import 'package:pawbuddy/UI/screens/pet_profile/pet_profile.dart';
import 'package:pawbuddy/UI/screens/veternity_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pawbuddy/UI/screens/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {return MyApp();},
 ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home_screen(),
    );
  }
}

