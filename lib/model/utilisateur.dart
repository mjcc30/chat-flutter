import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  late String uid;
  late String nom;
  late String prenom;
  String? logo;

  Utilisateur(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    uid = map["UID"];
    logo = map["LOGO"];
  }

  Utilisateur.vide() {
    uid = "";
    nom = "";
    prenom = "";
    logo = "";
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map;
    return map = {
      'NOM': nom,
      'PRENOM': prenom,
      'UID': uid,
      'LOGO': logo,
    };
  }
}
