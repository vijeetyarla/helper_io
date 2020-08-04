import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/func.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/home_post.dart';
import 'package:location/location.dart';

class HomeList extends StatefulWidget {
  @override
  HomeListState createState () => new HomeListState();
}

class HomeListState extends State<HomeList> {

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(stream: Firestore.instance.collection("posts").snapshots(), builder: (context, snapshot) {
      if(!snapshot.hasData){
        return Text("No Data");
      }
      else {
        return new ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.documents[index];
            return new HomePost(ds["name"], ds["request"], ds["phoneNumber"], ds["time"], ds.documentID);
          },
        );
      }
    },
    );

  }
}