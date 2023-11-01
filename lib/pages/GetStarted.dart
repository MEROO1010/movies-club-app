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
          color: HexColor('#1A1E26'),
        ),
        //add logo
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 300,
          ),
          padding: EdgeInsets.only(left: 48, top: 80),
        ),

        //add button
        Padding(
          padding: EdgeInsets.only(left: 150, top: 100),
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text('Get Started')),
          ),
        )
      ],
    );
  }
}
