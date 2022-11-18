// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_buss_tickets/User/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _firstnameCon = TextEditingController();
  final TextEditingController _lastnameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _userNameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _confirmpasswordCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    _firstnameCon.dispose();
    _lastnameCon.dispose();
    _emailCon.dispose();
    _userNameCon.dispose();
    _passwordCon.dispose();
    _confirmpasswordCon.dispose();
    _phoneCon.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future Signup() async {
    if (passwordConfirmed()) {
      //create User
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailCon.text, password: _passwordCon.text);
      // add user details
      addUserDetails(
          _firstnameCon.text.trim(),
          _lastnameCon.text.trim(),
          _emailCon.text.trim(),
          _userNameCon.text.trim(),
          _passwordCon.text.trim(),
          _confirmpasswordCon.text.trim(),
          _phoneCon.text.trim());
    }
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    String emailAddress,
    String userName,
    String passWord,
    String confirmPassword,
    String phoneNumber,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email address': emailAddress,
      'user name': userName,
      'password': passWord,
      'confirmPassword': confirmPassword,
      'phone number': phoneNumber,
    });
  }

  bool passwordConfirmed() {
    if (_passwordCon.text.trim() == _confirmpasswordCon.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('First Name must be of 6 characters');
                    }
                    return null;
                  },
                  controller: _firstnameCon,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter First Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 5) {
                      return ('Last Name must be of 5 characters');
                    }
                    return null;
                  },
                  controller: _lastnameCon,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter Last Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('Please Enter a valid Email Address');
                    }
                    return null;
                  },
                  controller: _emailCon,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('Email Address must be of 6 characters');
                    }
                    return null;
                  },
                  controller: _userNameCon,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter Username',
                    prefixIcon: Icon(Icons.person_add),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('Username must be of 6 characters');
                    }
                    return null;
                  },
                  controller: _passwordCon,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('Confirm Password must be of 6 characters');
                    }
                    return null;
                  },
                  controller: _confirmpasswordCon,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Enter Confirm Password',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 6) {
                      return ('Phone Number must be of 6 characters');
                    }
                    return null;
                  },
                  controller: _phoneCon,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                  child: const Text('Submit'),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      Signup();
                      await {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()))
                      };
                    } else {}
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: const Text('Already have an Account! Sign In'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
