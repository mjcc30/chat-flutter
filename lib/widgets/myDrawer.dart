import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //logo

        //Nom et le prénom
      ],
    );
  }

}