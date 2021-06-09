import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersDataBase {
  final String uid;

  UsersDataBase({this.uid});

  //collection reference users
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserModel> create(UserModel usermodel) async {
    try {
      var data = usermodel.toJson();
      await usersCollection
          .doc(uid)
          .set(data)
          .then((value) => print("User register ok"))
          .catchError((error) => print("Error register user"));
      return usermodel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> edit(UserModel usermodel) async {
    try {
      await usersCollection.doc(uid).update(usermodel.toJson());
      return usermodel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> find() async {
    UserModel _userModel;

    await usersCollection.doc(uid).get().then((snapshot) => {
          if (snapshot.exists)
            {
              _userModel = UserModel.fromJson(uid, snapshot.data()),
            }
        });

    return _userModel;
  }

  Future toList() async {
    try {
      /*var data = await usersCollection.get() as List;
      return data.map((i) => UserModel.fromJson(i)).toList();*/

      var data = await usersCollection.get();
      return data;
    } catch (e) {
      print(e);
      //return null;
    }
  }

  Future<void> delete() async {
    try {
      return await usersCollection.doc(uid).delete();
    } catch (e) {
      print(e);
    }
  }
}
