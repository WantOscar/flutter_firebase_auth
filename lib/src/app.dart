import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/view/login.dart';

import 'view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const LoginView();
        } else {
          return const HomeView();
        }
      },
    );
  }
}
