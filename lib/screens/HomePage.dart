import 'package:firstapplicationsqyavril2022/screens/Dashboard.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/library/constants.dart';
import 'package:firstapplicationsqyavril2022/screens/RegisterPage.dart';
import 'package:firstapplicationsqyavril2022/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late String mail;
  late String password;
  late String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Viens chatter avec un copain !'),
        ),
        body: Stack(
          children: [
            Background(),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: bodyPage(),
              ),
            )
          ],
        ));
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/gizmo.jpg"),
                fit: BoxFit.fill,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail, color: Colors.white),
            hintText: "Votre adresse mail",
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
          ),
          onChanged: (value) {
            setState(() {
              mail = value;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_rounded, color: Colors.white),
            hintText: "Votre mot de passe",
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
          ),
          obscureText: true,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            FirestoreHelper().connect(mail, password).then((value) {
              setState(() {
                FirestoreHelper().getIdenfiant().then((value) {
                  setState(() {
                    uid = value;
                  });
                  FirestoreHelper().getUtilisateur(uid).then((value) {
                    setState(() {
                      monProfil = value;
                    });
                  });
                });
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DashBoard(uid: uid);
              }));
            }).onError((error, stackTrace) {
              print("Problème de connexion");
            });
          },
          child: const Text("Connexion"),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: const Text(
            "Inscription",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return registerPage();
            }));
          },
        )
      ],
    );
  }
}
