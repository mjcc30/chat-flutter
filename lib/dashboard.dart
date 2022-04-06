import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget{
  String mail;
  
  DashBoard({required  this.mail});
  
  
  @override
  State<StatefulWidget> createState() {
  
    return DashBoardState();
  }

}

class DashBoardState extends State<DashBoard>{
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma Nouvelle page"),
      ),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Text("${widget.mail}");
  }

}