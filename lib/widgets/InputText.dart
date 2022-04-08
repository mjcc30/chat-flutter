import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';

class InputText extends StatefulWidget {
  Utilisateur receiver;
  Utilisateur sender;
  InputText(
      @required Utilisateur this.receiver, @required Utilisateur this.sender,
      {Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return InputTextState();
  }
}

var messageController = TextEditingController();

class InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration.collapsed(
                  hintText: "Ecrivez votre message",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none),
              maxLines: null,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: onSend,
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 18,
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  onSend() {
    if (messageController != "") {
      String text = messageController.text;
      FirestoreHelper().sendMessage(text, widget.receiver, widget.sender);
      setState(() {
        messageController.text = '';
      });
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
