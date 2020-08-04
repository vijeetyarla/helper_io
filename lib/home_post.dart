import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view_post.dart';

class HomePost extends StatefulWidget {
  String name;
  String request;
  String phoneNumber;
  String time;
  String docId;
  @override
  HomePostState createState () => new HomePostState(name, request, phoneNumber, time, docId);
  HomePost(String name, String request, String phoneNumber, String time, String id) {
    this.name = name;
    this.request = request;
    this.phoneNumber = phoneNumber;
    this.time = time;
    this.docId = id;
  }
}

class HomePostState extends State<HomePost>{
  String name, request, phoneNumber, id;
  String time;
  HomePostState(String name, String request, String phoneNumber, String time, String id) {
    this.name = name;
    this.request = request;
    this.phoneNumber = phoneNumber;
    this.time = time;
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        child: Column(
          children: <Widget>[

            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/helper_logo_h.png"),
              ),
              subtitle: Text(
                request, style: TextStyle(fontFamily: "Kayak Sans Regular", fontSize: 20),
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                this.time,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewPost(HomePost(name, request, phoneNumber, time, "id"))),
                );
              },

            ),




          ],
        ),
        onTap: (){},
      ),
    );
  }
}