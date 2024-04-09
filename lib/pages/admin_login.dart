import 'package:flutter/material.dart';

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[Text("Admin Login"), TextField()],
        ),
      ),
    );
  }
}
