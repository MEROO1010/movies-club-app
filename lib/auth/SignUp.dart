import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 30, 38, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/logo.png'),
              width: 200,
              margin: EdgeInsets.only(left: 10, top: 40),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Container(
                      width: 340,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          prefixIcon: Icon(Icons.account_circle_rounded),
                          hintText: 'Name',
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Container(
                      width: 340,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          prefixIcon: Icon(Icons.email_rounded),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Container(
                      width: 340,
                      child: TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          prefixIcon: Icon(Icons.visibility_off_outlined),
                          hintText: 'Password',
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 2),
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final Uri url = Uri.parse(
                                'https://your-django-backend.com/api/register/'); // Replace with your Django API endpoint
                            final response = await http.post(
                              url,
                              headers: {
                                'Content-Type': 'application/json',
                              },
                              body: jsonEncode({
                                'email': _email,
                                'password': _password,
                              }),
                            );

                            if (response.statusCode == 201) {
                              // User registered successfully, navigate to the homepage
                              Navigator.pushNamed(context, '/Homepage');
                            } else {
                              // Handle registration error
                              print(
                                  'Error registering user: ${response.statusCode}');
                            }
                          }
                        },
                        child: Text(
                          'Sign-Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(67, 96, 115, 1),
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          minimumSize: Size(300, 50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 70, bottom: 1),
                        child: Text(
                          'Already have an account?  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignIn');
                          },
                          child: Text(
                            'Sign-In',
                            style: TextStyle(
                              color: Color.fromRGBO(118, 147, 166, 1),
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
