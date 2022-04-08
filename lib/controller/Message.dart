import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/widgets/Toaster.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';
import 'package:firstapplicationsqyavril2022/model/Message.dart';

class Messagecontroller extends StatefulWidget {
  Utilisateur sender;
  Utilisateur receiver;
  Messagecontroller(
      @required Utilisateur this.sender, @required Utilisateur this.receiver);
  @override
  State<StatefulWidget> createState() {
    return MessagecontrollerState();
  }
}

class MessagecontrollerState extends State<Messagecontroller>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 10, end: 20).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper()
            .fire_message
            .orderBy('sendmessage', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
                itemCount: documents.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, int index) {
                  Message chat = Message(documents[index]);
                  if ((chat.from == widget.sender.uid &&
                          chat.to == widget.receiver.uid) ||
                      (chat.from == widget.receiver.uid &&
                          chat.to == widget.sender.uid)) {
                    return ToasterMessage(
                      widget.sender.uid,
                      widget.receiver,
                      chat,
                      animation: animation,
                    );
                  } else {
                    return Container();
                  }
                });
          }
        });
  }
}
