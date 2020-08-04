import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home_post.dart';
import 'package:location/location.dart';



List<HomePost> getPosts(){
  LocationData appLocation;
  //Location().getLocation().then((value) {appLocation = value;});
  //Based on location of post and location of user, filter through the posts and find where the post location is close to the user.
  List<HomePost> list = [HomePost("Vijeet Yarlagadda " + 1.toString(), "I need " + 1.toString() + " apples.", 1.toString() + " 9085284293", TimeOfDay.now().toString(), "id")];
  for(var i = 0; i < 5; i++){
    list.add(HomePost("Vijeet Yarlagadda " + i.toString(), "I need " + i.toString() + " apples.", i.toString() + " 9085284293", TimeOfDay.now().toString(), "id"));
  }
  return list;
}

HomePost createPost(String name, String request, String phoneNumber, String time, LocationData locationData) {
  //Add to Firebase Firestore
  Firestore _firestore = Firestore.instance;
  String id = _firestore.collection("posts").document().documentID;
  _firestore.collection("posts").document(id).setData({
    "name": name,
    "request": request,
    "phoneNumber": phoneNumber,
    "time": time,
    //"location": locationData,
  });
  HomePost post = new HomePost(name, request, phoneNumber, time, id);
  return post;
}