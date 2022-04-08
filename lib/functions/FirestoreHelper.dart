import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationsqyavril2022/model/Utilisateur.dart';

class FirestoreHelper {
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Users");
  final fire_storage = FirebaseStorage.instance;
  final fire_message = FirebaseFirestore.instance.collection("Message");
  final fire_conversation =
      FirebaseFirestore.instance.collection('Conversations');

  //Methode pour l'inscription
  Future register(
      String mail, String password, String nom, String prenom) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    String uid = resultat.user!.uid;
    Map<String, dynamic> map = {"NOM": nom, "PRENOM": prenom, "UID": uid};
    addUser(uid, map);
  }

  //Méthode pour la connexion
  Future connect(String mail, String password) async {
    UserCredential resultat =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
  }

  //Méthode pour enregistrer dans la base de donnée
  addUser(String uid, Map<String, dynamic> map) {
    fire_user.doc(uid).set(map);
  }

  updateUser(String uid, Map<String, dynamic> map) {
    fire_user.doc(uid).update(map);
  }

  Future<String> getIdenfiant() async {
    return await auth.currentUser!.uid;
  }

  Future<Utilisateur> getUtilisateur(String uid) async {
    DocumentSnapshot snapshot = await fire_user.doc(uid).get();
    return Utilisateur(snapshot);
  }

  Future<String> stockage(String name, Uint8List bytes) async {
    TaskSnapshot download =
        await FirebaseStorage.instance.ref("profil/$name").putData(bytes);
    String chemin = await download.ref.getDownloadURL();
    return chemin;
  }

  sendMessage(String texte, Utilisateur receiver, Utilisateur sender) {
    DateTime date = DateTime.now();
    Map<String, dynamic> map = {
      'from': sender.uid,
      'to': receiver.uid,
      'texte': texte,
      'sendmessage': date
    };
    String idDate = date.microsecondsSinceEpoch.toString();
    addMessage(map, getMessageRef(sender.uid, receiver.uid, idDate));
    addConversation(
        getConversation(sender.uid, receiver, texte, date), sender.uid);
    addConversation(
        getConversation(receiver.uid, sender, texte, date), receiver.uid);
  }

  Map<String, dynamic> getConversation(
      String sender, Utilisateur receiver, String texte, DateTime date) {
    Map<String, dynamic> map = receiver.toMap();
    map['sender'] = sender;
    map['lastmessage'] = texte;
    map['sendmessage'] = date;
    map['receiver'] = receiver.uid;

    return map;
  }

  String getMessageRef(String from, String to, String date) {
    String resultat = "";
    List<String> liste = [from, to];
    liste.sort((a, b) => a.compareTo(b));
    for (var x in liste) {
      resultat += x + "+";
    }
    resultat = resultat + date;
    return resultat;
  }

  addMessage(Map<String, dynamic> map, String uid) {
    fire_message.doc(uid).set(map);
  }

  addConversation(Map<String, dynamic> map, String uid) {
    fire_conversation.doc(uid).set(map);
  }
}
