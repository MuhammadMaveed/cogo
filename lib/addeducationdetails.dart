import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'fatchdatatwo_screen.dart';

class AddEducationDetails extends StatefulWidget {
  const AddEducationDetails({super.key});

  @override
  State<AddEducationDetails> createState() => _AddEducationDetailsState();
}

class _AddEducationDetailsState extends State<AddEducationDetails> {
  TextEditingController _matricMarkscontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _fscMarkscontroller = TextEditingController();
  TextEditingController _fscSubjectcontroller = TextEditingController();
  TextEditingController _matricSubjectcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Education Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Education Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(
                height: 20,
              ),
              Text("Student Name"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller:_namecontroller,
                decoration: InputDecoration(
                  hintText: "Student Name",
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
              SizedBox(
                height: 20,
              ),
              Text("Metric Marks"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _matricMarkscontroller,
                decoration: InputDecoration(
                  hintText: "Metric Marks",
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Metric Subject"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _matricSubjectcontroller,
                decoration: InputDecoration(
                  hintText: "Metric Subject",
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text("FSC Marks"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _fscMarkscontroller,
                decoration: InputDecoration(
                  hintText: "FSC Marks",
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text("FSC Subject"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _fscSubjectcontroller,
                decoration: InputDecoration(
                  hintText: "FSC Subject",
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
              SizedBox(
                height: 20,
              ),
              OurButton(
                onPress: () {
                  _addEducationDetails();
                },
                text: "Add Education Details",
              ),
              SizedBox(
                height: 20,
              ),
              OurButton(
                onPress: () {
                  _updateEducationDetails();
                },
                text: "Edit Details",
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addEducationDetails() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference addEducation =
        FirebaseFirestore.instance.collection('education').doc();
    addEducation.set({
      'userId': userId,
      'studentname':_namecontroller.text,
      'matricmarks': _matricMarkscontroller.text,
      'matricsubject': _matricSubjectcontroller.text,
      'fscmarks': _fscMarkscontroller.text,
      'fscsubject': _fscSubjectcontroller.text,
      'id': addEducation.id,
    }).then((value) {
      Fluttertoast.showToast(msg: "Details Add Successfully");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FatchDataTwoScreen(),
          ));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  _updateEducationDetails() async {
    DocumentReference edit = FirebaseFirestore.instance
        .collection('education')
        .doc('iZKEQktdQc7TXi3wHm6X');
    edit.update({
      'matricmarks': _matricMarkscontroller.text,
      'fscmarks': _fscMarkscontroller.text,
      'matricsubject': _matricSubjectcontroller.text,
      'fscsubject': _fscSubjectcontroller.text,
    }).then((value) {
      Fluttertoast.showToast(msg: "Details Update Successfullt");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
