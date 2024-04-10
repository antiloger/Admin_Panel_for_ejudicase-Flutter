import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pone/pages/adminhome.dart';
import '../Util/dbManager.dart';

class AdminLogin extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<AdminLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  bool _invalidEntriesVisibility = false;
  void changeInvalidEntryVisibility() {
    setState(() {
      _invalidEntriesVisibility = !_invalidEntriesVisibility;
    });
  }

  //List<bool> isSelected = [true, false]; // Default to Lawyer selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text("Login"),
      // ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Admin Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  if (_invalidEntriesVisibility)
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(
                            8), // Optional: if you want rounded corners
                      ),
                      child: const Text(
                        'Invalid email or password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.deepOrange),
                      ),
                    ),

                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      User? uCred = await authAdmin.signInUser(
                          emailAddr: _emailController.text,
                          Passwd: _passwordController.text);
                      if (uCred != null) {
                        print("user Authenticated and user is : $uCred");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminHome()), //TODO : redirect to lawyer Dash
                        );
                      } else {
                        changeInvalidEntryVisibility();
                      }
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),

                  //other auth systems
                ],
              ),
            ),
          ))),
    );
  }
}
