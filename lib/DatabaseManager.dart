import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  List itemList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("highscore");
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("accounts_list");
  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          itemList.add(result.data());
        }
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUserData() async {
    try {
      await userRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          itemList.add(result.data());
        }
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
