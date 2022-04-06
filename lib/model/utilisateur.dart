
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur{
    late String uid;
    late String nom;
    late String prenom;




    Utilisateur(DocumentSnapshot snapshot){
      uid = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      nom = map["NOM"];
      prenom = map["PRENOM"];


    }





}