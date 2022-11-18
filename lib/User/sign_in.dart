// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Busservices_homescreen/home_page_screen.dart';
import 'reset_password.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //TextEditing Controllers
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  //Snackbar
  mySnackBar({message, backgroundColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        '$message',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Top white Space sized Box
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              //Logo Container
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/app_icon_1.png"),
                )),
              ),
              //TextFields Column
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                bool emailFormat = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!);
                                if (!emailFormat) {
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                              controller: _emailCon,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter Email Address',
                                suffixIcon: Icon(Icons.person),
                                suffixIconColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _passwordCon,
                              obscureText: !_showPassword,
                              cursorColor: Colors.blue,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2.0),
                                ),
                                suffixIconColor: Colors.blue,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _togglevisibility();
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    //color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter password';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 1.12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //primary: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: _emailCon.text,
                                    password: _passwordCon.text,
                                  )
                                      .then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  }).onError((error, stackTrace) {
                                    // ignore: avoid_print
                                    print("Error ${error.toString()}");
                                  });
                                } else {
                                  mySnackBar(
                                      message:
                                          'Please Enter correct Login Details',
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: const Text(' Sign In '),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ResetPassword()),
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Divider(
                                  indent: 30.0,
                                  endIndent: 10.0,
                                  thickness: 1,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                "OR",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              Expanded(
                                child: Divider(
                                  indent: 10.0,
                                  endIndent: 20.0,
                                  thickness: 1,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 1.12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Signup(),
                                  ),
                                );
                              },
                              child: const Text('Create New Account! Sign Up'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
