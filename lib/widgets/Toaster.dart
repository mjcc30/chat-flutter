import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/model/Message.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';

class ToasterMessage extends StatelessWidget {
  final Message message;
  final Utilisateur receiver;
  final String sender;
  final Animation? animation;

  const ToasterMessage(this.sender, this.receiver, this.message,
      {Key? key, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: chatBubble(message.from == sender),
      ),
    );
  }

  List<Widget> chatBubble(bool sender) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment:
              (sender) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              elevation: 5.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: (sender) ? Colors.green.shade300 : Colors.blue.shade300,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  message.texte,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      )
    ];
  }
}
