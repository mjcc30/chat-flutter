import 'package:firstapplicationsqyavril2022/widgets/Custom.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return backgroundState();
  }

}

class backgroundState extends State<Background>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return ClipPath(
      clipper: Custom(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
      ),
    );
  }

}