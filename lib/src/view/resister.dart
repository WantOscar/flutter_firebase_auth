import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resister extends StatefulWidget {
  const Resister({super.key});

  @override
  State<Resister> createState() => _ResisterState();
}

class _ResisterState extends State<Resister> {
  final auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  void signUp() {
    try {
      auth
          .createUserWithEmailAndPassword(
              email: email.value.text, password: password.value.text)
          .then((value) {
        email.clear();
        password.clear();
        Get.back();
        // Navigator.of(context).pop();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('password too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      print('error');
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: password,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: signUp,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
