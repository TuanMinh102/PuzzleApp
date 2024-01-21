import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  List itemList = [];

  // Lấy điểm các ải
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("highscore");
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

// lấy tài khoản-mật khẩu
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("accounts_list");
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
