import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  String email;
  String password;

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future signUp() async {
    this.email = titleController.text;
    this.password = authorController.text;

    //Firebase auth でユーザー作成

    // firestoreに追加

    // await FirebaseFirestore.instance.collection('books').doc(book.id).update(
    //   {
    //     'title': title,
    //     'author': author,
    //   },
    // );
  }
}
