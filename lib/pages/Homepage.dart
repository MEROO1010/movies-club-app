import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending Movies',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CarouselSlider.builder(
                              itemCount: 10,
                              options: CarouselOptions(
                                  height: 300,
                                  autoPlay: true,
                                  viewportFraction: 0.55,
                                  enlargeCenterPage: true,
                                  pageSnapping: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 2)),
                              itemBuilder: (context, itemIndex, pageViewIndex) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: 300,
                                    width: 200,
                                    color: Colors.amber,
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Top rated movies',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: Colors.amber,
                                    height: 200,
                                    width: 150,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
