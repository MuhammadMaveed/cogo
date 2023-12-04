import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendDataScreen extends StatefulWidget {
  const SendDataScreen({super.key});

  @override
  State<SendDataScreen> createState() => _SendDataScreenState();
}

class _SendDataScreenState extends State<SendDataScreen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _fnamecontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();
  TextEditingController _countrycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text("Father Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _fnamecontroller,
                decoration: InputDecoration(
                  hintText: "Father Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text("City Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _citycontroller,
                decoration: InputDecoration(
                  hintText: "City Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text("Country Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _countrycontroller,
                decoration: InputDecoration(
                  hintText: "Country Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(height: 50),
              OurButton(
                onPress: (){
                  _customerDetails();
                },
                text: "Send Data",
              ),
          ]

          ),
        ),
      ),
    );
  }
  _customerDetails() async {
    String userId=FirebaseAuth.instance.currentUser!.uid;
    DocumentReference customerDetailsId =  FirebaseFirestore.instance.collection('CustomerDetails').doc();
    customerDetailsId.set({
      'name':_namecontroller.text,
      'father Name': _fnamecontroller.text,
      'city name': _citycontroller.text,
      'country name': _countrycontroller.text,
      "product id" :  customerDetailsId.id,
      'userId':userId,
    }).then((value) {
      Fluttertoast.showToast(msg: "Product Add Successfully");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
