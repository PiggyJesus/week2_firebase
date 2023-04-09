import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:week2_firebase/presentation/my_app.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAR39IfmA4XPYJjwqddDzrSv-4_VudRXto',
      appId: '1:691607130671:android:c7b0d1f2a57217bf91acda',
      messagingSenderId: '691607130671',
      projectId: 'mobyte-todos',
    ),
  );
  runApp(const MyApp());
}

