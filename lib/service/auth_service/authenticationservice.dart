// // ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task/model/usermodel.dart';

class AuthService {
  String? verificationid;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String collection = 'User';
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<UserModel> user;

  AuthService() {
    user = FirebaseFirestore.instance
        .collection(collection)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(
          snapshot.data()!,
        );
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> addUser(UserModel data) async {
    try {
      await user.doc(firebaseAuth.currentUser!.uid).set(data);
    } catch (e) {
      log('Error adding post :$e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final snapshot = await firestore
        .collection(collection)
        .doc(firebaseAuth.currentUser?.uid)
        .get();

    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromJson(
        snapshot.data()!,
      );
    } else {
      return null;
    }
  }

  Future<UserCredential> signUpEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Account created');
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('User loged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutEmail() async {
    await firebaseAuth.signOut();
  }

  updateUser(userid, UserModel data) async {
    try {
      await user.doc(userid).update(
            data.toJson(),
          );
    } catch (e) {
      log("error in updating product : $e");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection(collection).get();

      List<UserModel> data = snapshot.docs
          .map(
            (e) => UserModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return data;
    } catch (e) {
      log('get error: $e');
      rethrow;
    }
  }
}
