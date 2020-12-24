import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  final _db = FirebaseFirestore.instance;
  DocumentSnapshot retData;

  Future addToDatabase(String userid, String name, String mobile, String gender,
      String age, String height, String weight) async {
    await _db.collection(userid).doc("Personal Data").set({
      'Name': name,
      'mobile': mobile,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
    });
  }
}
