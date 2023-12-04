import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FatchDataTwoScreen extends StatefulWidget {
  const FatchDataTwoScreen({super.key});

  @override
  State<FatchDataTwoScreen> createState() => _FatchDataTwoScreenState();
}

class _FatchDataTwoScreenState extends State<FatchDataTwoScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('education')
            .where('userId', isEqualTo: currentUser)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Text(data[index]['fscmarks']),
                  leading:Text(data[index]['matricmarks']) ,
                  title: Text(data[index]['studentname']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
