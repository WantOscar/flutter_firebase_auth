import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/view/resister.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  void signIn() {
    auth.signInWithEmailAndPassword(
        email: email.value.text.trim(), password: password.value.text.trim());
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
              onPressed: signIn,
              child: const Icon(Icons.login),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Resister()));
              },
              child: const Text('Resister'),
            ),
          ],
        ),
      ),
    );
  }
}
