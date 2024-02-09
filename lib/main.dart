import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wordpower_app/screens/home/home_root.dart';
import 'controller/initialize_controllers.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/screens/intro/onboarding.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      name: 'wordpower app',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {}

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: user != null ? HomeRoot() : const OnboardingScreen());
  }
}
