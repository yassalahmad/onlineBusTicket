// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_buss_tickets/User/sign_in.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: const Text('Reset',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: const Text('Password',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(245.0, 175.0, 0.0, 0.0),
                  child: const Text(
                    '   ?',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Enter the email address associated with your account!',
                    style: TextStyle(
                        fontSize: 25.0,
                        //fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _emailCon,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email Address',
                      // prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 1.12,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      //onPressed: _showAlertDialog,
                      onPressed: () {
                        FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _emailCon.text,
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Reset password link has been sent to your registerd Email',
                            ),
                            content: Wrap(
                              children: [
                                const Text(
                                  'Follow the link to reset your Online Bus Ticket Application password',
                                )
                              ],
                            ),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 3))
                            .then((value) {
                          Navigator.pop(context);
                        }).then((value) {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          }
                        });
                      },
                      child: const Text('Reset Password'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
