import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      //background color
      Container(
        color: Color.fromRGBO(26, 30, 38, 1),
      ),

      //logo
      Container(
        child: Image.asset('assets/images/logo.png'),
        width: 200,
        margin: EdgeInsets.only(left: 100, top: 40),
      ),

      //text label 1
      Padding(
        padding: EdgeInsets.only(top: 60, left: 30),
        child: Container(
          width: 340,
          child: Material(
            child: TextField(
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
      ),

      //text label 2
      Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Container(
          width: 340,
          child: Material(
            child: TextField(
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
            ),
          ),
        ),
      ),

      //text label 3
      Padding(
        padding: EdgeInsets.only(top: 20, left: 30),
        child: Container(
          width: 340,
          child: Material(
            child: TextField(
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
            ),
          ),
        ),
      ),

      // add sign-up button
      Padding(
        padding: EdgeInsets.only(left: 50, top: 50),
        child: Container(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Homepage');
              },
              child: Text(
                'Sign-Up',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(67, 96, 115, 1),
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(300, 50))),
        ),
      ),

      //add text
      Row(
        children: [
          Container(
            child: Text(
              'Already have an account?  ',
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            padding: EdgeInsets.only(left: 70, top: 50),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: Text(
                'Sign-In',
                style: TextStyle(
                    color: Color.fromRGBO(118, 147, 166, 1),
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            padding: EdgeInsets.only(top: 50),
          ),
        ],
      )
    ]);
  }
}
