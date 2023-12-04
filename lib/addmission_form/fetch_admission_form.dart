import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/addmission_form/admission_form_send_data.dart';
import 'package:cogo/addmission_form/update_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchDataForm extends StatefulWidget {
  const FetchDataForm({super.key});

  @override
  State<FetchDataForm> createState() => _FetchDataFormState();
}

class _FetchDataFormState extends State<FetchDataForm> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdmissionFormSendData(),
              ));
        },
      ),
      appBar: AppBar(
        title: Text("Fetch Data Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('studentForms')
                  .where('userId', isEqualTo: uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No data Found !'));
                } else {
                  var data = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateData(
                                    data: data[index],
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index]['studentName']),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(data[index]['fatherName']),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(data[index]['fscMarks']),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(data[index]['matricMarks']),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(data[index]['studentGender']),
                                      Spacer(),
                                      Text(data[index]['selectedDeparment']),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
