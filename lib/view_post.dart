import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home_post.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPost extends StatelessWidget {
  String name;
  String request;
  String phoneNumber;

  ViewPost(HomePost homePost){
    name = homePost.name;
    phoneNumber = homePost.phoneNumber;
    request = homePost.request;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: FlatButton(child: Icon(CupertinoIcons.back),onPressed: () {
            _onBackPress(context);
          }),
        ),
        title: Text(name, style: TextStyle(fontFamily: "Kayak Sans Bold", color: Colors.pinkAccent)),
        actions: <Widget>[],
      ),
      body: Column(children: <Widget>[Center(child:Text(request, style:  TextStyle(fontFamily: "Kayak Sans Regular", color: Colors.pinkAccent, fontSize: 30)),),
                                      Center(child:Text("Phone Number: " + phoneNumber, style:  TextStyle(fontFamily: "Kayak Sans Regular", color: Colors.pinkAccent, fontSize: 20),)),
                                      Center(child: FlatButton.icon(onPressed: () {_launchCaller(phoneNumber);}, icon: Icon(CupertinoIcons.phone_solid), label: Text("Call Person"),))
                                      ], mainAxisAlignment: MainAxisAlignment.center,
      )

    );
  }
  _launchCaller(String number) async {
    var url = "tel:"+number;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _onBackPress(BuildContext context) {
    Navigator.pop(context);
  }
}