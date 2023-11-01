import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

        //add button
        Padding(
          padding: EdgeInsets.only(left: 100, top: 140),
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text(
                  'Get Started',
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
                    minimumSize: Size(225, 50))),
          ),
        )
      ],
    );
  }
}
