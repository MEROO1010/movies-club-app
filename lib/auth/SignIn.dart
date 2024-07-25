import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;

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
                hintText: 'User Name',
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
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      textDirection: TextDirection.rtl),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                contentPadding: EdgeInsets.all(16),
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
                'Sign-In',
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
              'Do not have an account ?  ',
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
                Navigator.pushNamed(context, '/SignUp');
              },
              child: Text(
                'Sign-Up',
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
