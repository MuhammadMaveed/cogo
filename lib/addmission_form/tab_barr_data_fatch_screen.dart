import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogo/addmission_form/admission_form_send_data.dart';
import 'package:cogo/addmission_form/update_data.dart';
import 'package:cogo/common_widgets/our_button.dart';
import 'package:flutter/material.dart';

class TabBarDataFatch extends StatefulWidget {
  const TabBarDataFatch({super.key});

  @override
  State<TabBarDataFatch> createState() => _TabBarDataFatchState();
}

class _TabBarDataFatchState extends State<TabBarDataFatch> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                TabBar(indicatorSize: TabBarIndicatorSize.tab, tabs: [
                  Text('Computer Science'),
                  Text('Pharmacy'),
                  Text('English'),
                  Text('Psycology'),
                ]),
                Expanded(
                  child: TabBarView(children: [
                    /// Computer Science
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('studentForms')
                                .where('selectedDeparment',
                                    isEqualTo: 'Computer Science')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(child: Text("Record Not Found"));
                              } else {
                                var data = snapshot.data!.docs;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length,
                                  shrinkWrap: true,
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
                                                  data:data[index] ,
                                                ),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data[index]['studentName']),
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
                                                Text(
                                                    data[index]['matricMarks']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Divider(),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(data[index]
                                                        ['studentGender']),
                                                    Spacer(),
                                                    Text(data[index]
                                                        ['selectedDeparment']),
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

                    /// Pharmacy Students
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('studentForms')
                                .where('selectedDeparment',
                                    isEqualTo: 'Pharmacy')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No Record Found'));
                              } else {
                                var data = snapshot.data!.docs;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 16),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //     ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data[index]['studentName']),
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
                                                Text(
                                                    data[index]['matricMarks']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Divider(),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(data[index]
                                                        ['studentGender']),
                                                    Spacer(),
                                                    Text(data[index]
                                                        ['selectedDeparment']),
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

                    /// English Students
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('studentForms')
                                .where('selectedDeparment',
                                    isEqualTo: 'English')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('Record Not Found'));
                              } else {
                                var data = snapshot.data!.docs;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 16),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //     ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data[index]['studentName']),
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
                                                Text(
                                                    data[index]['matricMarks']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Divider(),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(data[index]
                                                        ['studentGender']),
                                                    Spacer(),
                                                    Text(data[index]
                                                        ['selectedDeparment']),
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

                    /// Psychology Students
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ///
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('studentForms')
                                .where('selectedDeparment',
                                    isEqualTo: 'Psychology')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No Record Found'));
                              } else {
                                var data = snapshot.data!.docs;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 16),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //     ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data[index]['studentName']),
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
                                                Text(
                                                    data[index]['matricMarks']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Divider(),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(data[index]
                                                        ['studentGender']),
                                                    Spacer(),
                                                    Text(data[index]
                                                        ['selectedDeparment']),
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
                  ]),
                ),
              ],
            ),

            /// Add Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: OurButton(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdmissionFormSendData(),
                          ));
                    },
                    title: "Add Form"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
