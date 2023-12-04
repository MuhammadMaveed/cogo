import 'package:cogo/addmission_form/admission_form_send_data.dart';
import 'package:cogo/addmission_form/tab_barr_data_fatch_screen.dart';
import 'package:cogo/fatchdata_screen.dart';
import 'package:cogo/fatchdatatwo_screen.dart';
import 'package:cogo/login_screen.dart';
import 'package:cogo/senddata_screen.dart';
import 'package:cogo/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'addeducationdetails.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    // home:TabBarDataFatch() ,
     home:SignupScreen(),
     // home: AddEducationDetails(),
    );
  }
}


