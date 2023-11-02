import 'package:flutter/material.dart';
import 'package:movies_club/model/fetch_movies.dart';
import 'package:movies_club/model/movies.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Color.fromRGBO(26, 30, 38, 1),
        ),
        Container(
          child: Text(
            'What do you want to watch?',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          padding: EdgeInsets.only(left: 30, top: 40),
        ),
        Padding(
          padding: EdgeInsets.only(top: 28, left: 30),
          child: Container(
            width: 320,
            height: 50,
            child: Material(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search..',
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
        Container(),
      ],
    );
  }
}
