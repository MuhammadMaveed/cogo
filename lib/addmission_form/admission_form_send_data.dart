import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/addmission_form/fetch_admission_form.dart';
import 'package:cogo/common_widgets/custom_textfield.dart';
import 'package:cogo/common_widgets/our_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdmissionFormSendData extends StatefulWidget {
  const AdmissionFormSendData({super.key});

  @override
  State<AdmissionFormSendData> createState() => _AdmissionFormSendDataState();
}

class _AdmissionFormSendDataState extends State<AdmissionFormSendData> {
  String _selectedItem = '';
   TextEditingController _namecontroller = TextEditingController();
   TextEditingController _fathernamecontroller = TextEditingController();
  TextEditingController _fscmarkscontroller = TextEditingController();
   TextEditingController _fscsubjectcontroller = TextEditingController();
  TextEditingController _matricmarkscontroller = TextEditingController();
   TextEditingController _matricsubjectcontroller =
      TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();

  List<String> _items = [
    'Computer Science',
    'English',
    'Pharmacy',
    'Psychology'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addmission Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("University Admission Form",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "Student Name",
                  hintText: "Enter Name",
                  controller: _namecontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "Father Name",
                  hintText: "Enter Father Name",
                  controller: _fathernamecontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "FSC Marks",
                  hintText: "Enter FSC Marks",
                  controller: _fscmarkscontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "FSC Subject",
                  hintText: "Enter FSC Subject",
                  controller: _fscsubjectcontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "Matric Marks",
                  hintText: "Enter Matric Marks",
                  controller: _matricmarkscontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "Matric Subject",
                  hintText: "Enter Matric Subject",
                  controller: _matricsubjectcontroller),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  title: "Gender",
                  hintText: "Enter Gender",
                  controller: _gendercontroller),
              SizedBox(
                height: 10,
              ),
              Text('Select an option:'),
              SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                hint: Text('Please Select Option'),
                items: _items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: OurButton(
                  title: 'Submit Form',
                  onPress:(){
                    _sendFormData();
                  }
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendFormData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference sendFormDataId =
        FirebaseFirestore.instance.collection('studentForms').doc();
    sendFormDataId.set({
      'docomentId':sendFormDataId.id,
      'userId':uid,
      'studentName': _namecontroller.text,
      'fatherName': _fathernamecontroller.text,
      'fscMarks': _fscmarkscontroller.text,
      'fscSubject': _fscsubjectcontroller.text,
      'matricMarks': _matricmarkscontroller.text,
      'matricSubject': _matricsubjectcontroller.text,
      'studentGender': _gendercontroller.text,
      'selectedDeparment': _selectedItem.toString(),
    }).then((value) {
      Fluttertoast.showToast(msg: 'Form Submit Successfully');
      Navigator.pop(context);
      // Navigator.push(context, MaterialPageRoute(builder: (context) =>
      //   FetchDataForm(),));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
