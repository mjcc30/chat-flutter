import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';
import 'package:firstapplicationsqyavril2022/screens/ChatPage.dart';

class detailPage extends StatefulWidget {
  Utilisateur user;
  Utilisateur monProfil;
  detailPage({
    Key? key,
    required this.user,
    required this.monProfil,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return detailState();
  }
}

class detailState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          title: const Text("Mon copain"),
        ),
        backgroundColor: Colors.blue.shade300,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: bodyPage(),
            )
          ],
        ));
  }

  Widget bodyPage() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: widget.user.uid,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (widget.user.logo != null)
                        ? NetworkImage(widget.user.logo!)
                        : const NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/projetsqyavril2022.appspot.com/o/noImage.png?alt=media&token=dc26627a-5c9f-491b-8529-c8b44bfad00a"))),
          ),
        ),
        //Image
        const SizedBox(height: 15),

        //nom et prénom
        Text("${widget.user.prenom} ${widget.user.nom}",
            style: const TextStyle(color: Colors.white)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green.shade300, // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChatPage(sender: widget.monProfil, receiver: widget.user);
            }));
          },
          child: Text("Chatter avec ${widget.user.prenom}"),
        )
      ],
    ));
  }
}
