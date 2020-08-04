import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/func.dart';
import 'package:flutter_app/view_post.dart';
import 'package:location/location.dart';
class AddPost extends StatelessWidget {

  TextEditingController nameController = new TextEditingController();
  TextEditingController requestController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
         title: Text("Add Post", style: TextStyle(fontFamily: "Kayak Sans Bold", color: Colors.pinkAccent)),
         actions: <Widget>[],
       ),
       body: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(child:Text("Name", style: TextStyle(fontFamily: "Kayak Sans Regular", fontSize: 16, ), textAlign: TextAlign.left,), padding: EdgeInsets.fromLTRB(10, 10, 0, 0),),
                  Padding(child:TextField(controller: nameController,), padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  Padding(child:Text("What do you need?", style: TextStyle(fontFamily: "Kayak Sans Regular", fontSize: 16, ), textAlign: TextAlign.left,), padding: EdgeInsets.fromLTRB(10, 10, 0, 0),),
                  Padding(child:TextField(minLines: 3, maxLines: 100, controller: requestController,), padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  Padding(child:Text("Phone Number", style: TextStyle(fontFamily: "Kayak Sans Regular", fontSize: 16, ), textAlign: TextAlign.left,), padding: EdgeInsets.fromLTRB(10, 10, 0, 0),),
                  Padding(child:TextField(keyboardType: TextInputType.numberWithOptions(),controller: phoneNumberController,), padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                  Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
                  Center(child:ButtonTheme(minWidth: 200, height: 40, child:OutlineButton(child:Text("Create Post", style: TextStyle(fontSize: 20, color: Colors.pinkAccent, fontFamily: "Kayak Sans Bold"),), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0), side: BorderSide(color: Colors.pinkAccent)), onPressed: () {_onCreateButtonPress(context);},)))
                ]

       )
    );
  }
  void _onCreateButtonPress(BuildContext context) async{
    LocationData locationData;// = await Location().getLocation();
   /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewPost(createPost(nameController.text, requestController.text, phoneNumberController.text, TimeOfDay.now(), locationData))),
    );*/
    createPost(nameController.text, requestController.text, phoneNumberController.text, TimeOfDay.now().format(context), locationData);
    Navigator.pop(context);
  }
  void _onBackPress(BuildContext context) {
    Navigator.pop(context);
  }
}