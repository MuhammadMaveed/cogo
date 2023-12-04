import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FatchDataScreen extends StatefulWidget {
  const FatchDataScreen({super.key});

  @override
  State<FatchDataScreen> createState() => _FatchDataScreenState();
}

class _FatchDataScreenState extends State<FatchDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('CustomerDetails')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    var data = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap:true,
                      itemCount:data.length,
                      itemBuilder: (context, index) {

                        return ListTile(
                          title: Text(data[index]['father Name']),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
