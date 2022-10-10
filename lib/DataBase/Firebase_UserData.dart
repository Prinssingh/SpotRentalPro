import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:spot_buy/Models/UserDataModel.dart';

class Firebase_UserData{
  FirebaseDatabase database = FirebaseDatabase.instance;
  String UID = FirebaseAuth.instance.currentUser!.uid;


  saveUserData(UserDataModel user) async {
    if(UID!=null){
    DatabaseReference ref = database.ref("UsersData/"+UID);
    await ref.set(user.toMap());

    }
  }

  updateUserData(UserDataModel user) async {
    if(UID!=null){
      DatabaseReference ref = database.ref("UsersData/"+UID);

      await ref.update(user.toMap());

    }
  }



}