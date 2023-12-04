import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/senddata_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/our_button.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _nameContoller = TextEditingController();

  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _conformpasswordContoller =
      TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Create An Account"
                    .text
                    .fontWeight(FontWeight.bold)
                    .size(24)
                    .make(),
                25.heightBox,
                "Enter the given details to create an account"
                    .text
                    .color(const Color(0xff838589))
                    .size(15)
                    .make(),
                40.heightBox,
                CustomTextfield(
                  isOb: false,
                  controller: _emailContoller,
                  title: "Enter Your Email",
                  hintText: "example@gmail.com",
                ),
                25.heightBox,
                CustomTextfield(
                  isOb: false,
                  controller: _nameContoller,
                  title: "User Name",
                  hintText: "Berlin",
                ),
                25.heightBox,
                CustomTextfield(
                  isOb: true,
                  controller: _passwordContoller,
                  title: "Password",
                  hintText: "******",
                  suffIcon: const Icon(
                    Icons.visibility,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                25.heightBox,
                CustomTextfield(
                  isOb: true,
                  controller: _conformpasswordContoller,
                  title: "Conform Password",
                  hintText: "******",
                  suffIcon: const Icon(
                    Icons.visibility,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                25.heightBox,
                SizedBox(
                  height: 50,
                  width: context.screenWidth - 40,
                  child: OurButton(
                    onPress: () async {
                      _registerUser();
                    },
                    title: "Confirmation",
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OurButton(
                        onPress: () {
                          _signInWithGoogle();
                        },
                        title: "Sign in with Google"),
                    Spacer(),
                    OurButton(
                        onPress: () {
                          _signInWithFacebook();
                        },
                        title: "Sign in with FaceBook"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) {
            Fluttertoast.showToast(msg: "Login with Facebook Successfully");
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  _signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Fluttertoast.showToast(msg: 'SigIn With Google Successfully');
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  _registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailContoller.text, password: _passwordContoller.text)
        .then((value) async {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': _nameContoller.text,
        'email': _emailContoller.text,
      }).then((value) {
        Fluttertoast.showToast(msg: "Register Successfully");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendDataScreen(),
            ));
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
