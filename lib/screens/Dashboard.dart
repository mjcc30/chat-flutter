import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationsqyavril2022/screens/DetailPage.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/library/constants.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';
import 'package:firstapplicationsqyavril2022/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  String uid;

  DashBoard({required this.uid});

  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    print(monProfil.uid);

    return Scaffold(
      drawer: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.5,
        child: myDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Ma liste de copains"),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().fire_user.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            List documents = snapshot.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Utilisateur user = Utilisateur(documents[index]);
                  if (monProfil.uid != user.uid) {
                    return Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5.0,
                      child: ListTile(
                        textColor: Colors.white,
                        tileColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: Hero(
                          tag: user.uid,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (user.logo != null)
                                        ? NetworkImage(user.logo!)
                                        : NetworkImage(
                                            "https://firebasestorage.googleapis.com/v0/b/projetsqyavril2022.appspot.com/o/noImage.png?alt=media&token=dc26627a-5c9f-491b-8529-c8b44bfad00a"))),
                          ),
                        ),
                        title: Text("${user.prenom} ${user.nom}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) {
                                    return detailPage(
                                      monProfil: monProfil,
                                      user: user,
                                    );
                                  }));
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                });
          }
        });
  }
}
