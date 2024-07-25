import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _Splsh_screenState();
}

class _Splsh_screenState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Color.fromRGBO(26, 30, 38, 1),
        ),
        //add logo
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
          padding: EdgeInsets.only(left: 110, top: 180),
        ),

        //add sign-in button
        Padding(
          padding: EdgeInsets.only(left: 100, top: 80),
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignIn');
                },
                child: Text(
                  'Sign-In',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(118, 147, 165, 1),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(225, 50))),
          ),
        ),

        //add sign-up button
        Padding(
          padding: EdgeInsets.only(left: 100, top: 40),
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text(
                  'Sign-Up',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(40, 66, 89, 1),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(225, 50))),
          ),
        )
      ],
    );
  }
}
