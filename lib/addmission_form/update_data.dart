import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/common_widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_widgets/custom_textfield.dart';

class UpdateData extends StatefulWidget {
  final dynamic data;

  const UpdateData({super.key, this.data});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late TextEditingController _namecontroller;
  late TextEditingController _fathernamecontroller;
  late TextEditingController _fscmarkscontroller;
  late TextEditingController _fscsubjectcontroller;
  late TextEditingController _matricmarkscontroller;
  late TextEditingController _matricsubjectcontroller;
  late TextEditingController _gendercontroller;
  String? department;

  List<String> _items = [
    'Computer Science',
    'English',
    'Pharmacy',
    'Psychology'
  ];

  @override
  void initState() {
    _namecontroller = TextEditingController(text: widget.data['studentName']);
    _fathernamecontroller =
        TextEditingController(text: widget.data['fatherName']);
    _fscmarkscontroller = TextEditingController(text: widget.data['fscMarks']);
    _fscsubjectcontroller =
        TextEditingController(text: widget.data['fscSubject']);
    _matricsubjectcontroller =
        TextEditingController(text: widget.data['matricSubject']);
    _matricmarkscontroller =
        TextEditingController(text: widget.data['matricMarks']);
    _gendercontroller =
        TextEditingController(text: widget.data['studentGender']);
    department=widget.data['selectedDeparment'];

    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _fathernamecontroller.dispose();
    _fscsubjectcontroller.dispose();
    _fscmarkscontroller.dispose();
    _matricmarkscontroller.dispose();
    _matricsubjectcontroller.dispose();
    _gendercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                value: department,
                hint: Text('Please Select Option'),
                items: _items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    department = newValue!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              OurButton(
                  onPress: () {
                    _updateAllData();
                  },
                  title: 'Update')
            ],
          ),
        ),
      ),
    );
  }

  _updateAllData() {
    FirebaseFirestore.instance
        .collection('studentForms')
        .doc(widget.data.id)
        .set({
      'studentName': _namecontroller.text,
      'fatherName': _fathernamecontroller.text,
      'fscMarks': _fscmarkscontroller.text,
      'fscSubject': _fscsubjectcontroller.text,
      'matricMarks': _matricmarkscontroller.text,
      'matricSubject': _matricsubjectcontroller.text,
      'studentGender': _gendercontroller.text,
      'selectedDeparment': department,
    }, SetOptions(merge: true)).then((value) {
      Fluttertoast.showToast(msg: "Data Update Successfully");
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
