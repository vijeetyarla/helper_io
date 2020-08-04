import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/add_post.dart';
import 'package:flutter_app/home_list.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  LocationData appLocation;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title: SizedBox(
            height: 35.0, child: Image.asset("assets/images/helper_logo_text.png")),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: FlatButton(child: Icon(CupertinoIcons.plus_circled),onPressed: () {
              _onPlusPress(context);
            }),
          )
        ],
      ),
      body: HomeList(),
    );
  }
  void _onPlusPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()),
    );
  }

}