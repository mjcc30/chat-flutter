import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/controller/Message.dart';
import 'package:firstapplicationsqyavril2022/widgets/InputText.dart';

class ChatPage extends StatefulWidget {
  Utilisateur sender;
  Utilisateur receiver;
  ChatPage({Key? key, required this.sender, required this.receiver})
      : super(key: key);
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: (widget.receiver.logo != null)
                        ? NetworkImage(widget.receiver.logo!)
                        : const NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/projetsqyavril2022.appspot.com/o/noImage.png?alt=media&token=dc26627a-5c9f-491b-8529-c8b44bfad00a"),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${widget.receiver.prenom} ${widget.receiver.nom}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            bodyPage(),
          ],
        ));
  }

  Widget bodyPage() {
    return InkWell(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Flexible(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Messagecontroller(widget.sender, widget.receiver),
          )),
          const Divider(
            height: 2,
          ),
          InputText(widget.receiver, widget.sender),
        ],
      ),
    );
  }
}
