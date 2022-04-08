import 'package:firstapplicationsqyavril2022/screens/Dashboard.dart';
import 'package:firstapplicationsqyavril2022/functions/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerPageState();
  }
}

class registerPageState extends State<registerPage> {
  late String mail;
  late String password;
  late String prenom;
  late String nom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueAccent,
      extendBodyBehindAppBar: true,
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                prefixIcon: const Icon(Icons.person, color: Colors.white),
                hintText: "Votre prénom",
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  prenom = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                prefixIcon: const Icon(Icons.person, color: Colors.white),
                hintText: "Votre nom",
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  nom = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
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
                contentPadding: const EdgeInsets.all(20.0),
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
                  FirestoreHelper().register(mail, password, nom, prenom);
                },
                child: const Text("Inscription"))
          ],
        ));
  }
}
