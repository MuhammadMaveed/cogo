import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/addeducationdetails.dart';
import 'package:cogo/addmission_form/admission_form_send_data.dart';
import 'package:cogo/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:velocity_x/velocity_x.dart';

import 'addmission_form/fetch_admission_form.dart';
import 'common_widgets/custom_textfield.dart';
import 'common_widgets/loading.dart';
import 'common_widgets/our_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailContoller = TextEditingController();

  final TextEditingController _passwordContoller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "LOGO".text.fontWeight(FontWeight.bold).size(24).make(),
              40.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        "Hi, Welcome Back!"
                            .text
                            .fontWeight(FontWeight.w500)
                            .size(24)
                            .make(),
                      ],
                    ),
                    25.heightBox,
                    CustomTextfield(
                      isOb: false,
                      controller: _emailContoller,
                      title: "Email",
                      hintText: "example@gmail.com",
                    ),
                    25.heightBox,
                    CustomTextfield(
                      isOb: true,
                      controller: _passwordContoller,
                      title: "Password",
                      hintText: "Enter Your Password",
                      suffIcon: Icon(
                        Icons.visibility,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    25.heightBox,
                    Row(
                      children: [
                        "Remember Me"
                            .text
                            .fontWeight(FontWeight.w500)
                            .size(14)
                            .make(),
                        Spacer(),
                        "Forgot Password?"
                            .text
                            .color(Colors.red)
                            .fontWeight(FontWeight.w500)
                            .size(14)
                            .make(),
                      ],
                    ),
                    25.heightBox,
                    isLoading
                        ? loadingIndicator()
                        : SizedBox(
                            height: 50,
                            width: context.screenWidth - 40,
                            child: OurButton(
                              onPress: (){
                                _loginUser();
                              },
                              title: "Login",
                              textColor: Colors.white,
                            ),
                          ),
                    25.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Dont have an Account?"
                            .text
                            .color(Colors.black)
                            .fontWeight(FontWeight.w500)
                            .size(16)
                            .make(),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: "Sign Up"
                              .text
                              .color(Color(0xff3669C9))
                              .fontWeight(FontWeight.w500)
                              .size(16)
                              .make(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailContoller.text, password: _passwordContoller.text)
        .then((value) {
      Fluttertoast.showToast(msg: "Login Successfully");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FetchDataForm(),
          ));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
