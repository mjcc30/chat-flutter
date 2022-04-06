import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreHelper{
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Users");
  final fire_storage = FirebaseStorage.instance;





  //Methode pour l'inscription
  Future register(String mail,String password,String nom, String prenom) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid = resultat.user!.uid;
    Map<String,dynamic> map = {
      "NOM":nom,
      "PRENOM":prenom,
      "UID":uid
    };
    addUser(uid, map);

  }




  //Méthode pour la connexion

  Future connect(String mail, String password) async{
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
  }



  //Méthode pour enregistrer dans la base de donnée
  addUser(String uid,Map<String,dynamic> map){
    fire_user.doc(uid).set(map);

  }

  String getIdenfiant(){
    return auth.currentUser!.uid;
    
  }







}