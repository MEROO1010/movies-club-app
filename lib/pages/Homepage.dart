import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_club/api_service/api.dart';
import 'package:movies_club/model/movies.dart';
import 'package:movies_club/widgets/movieslider.dart';
import 'package:movies_club/widgets/trendingslider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Color.fromRGBO(26, 30, 38, 1),
        ),
        Container(
          child: Text(
            'What do you want to watch?',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          padding: EdgeInsets.only(left: 30, top: 36),
        ),
        Padding(
          padding: EdgeInsets.only(top: 18, left: 30),
          child: Container(
            margin: EdgeInsets.only(right: 30),
            height: 48,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
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
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      // const TrendingSlider(),
                      SizedBox(
                        child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else if (snapshot.hasData) {
                              return TrendingSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Top rated movies',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            textStyle: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      SizedBox(
                        child: FutureBuilder(
                          future: topRatedMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else if (snapshot.hasData) {
                              return MovieSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Upcoming movies',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            textStyle: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      // const MovieSlider(),
                      SizedBox(
                        child: FutureBuilder(
                          future: upcomingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else if (snapshot.hasData) {
                              return MovieSlider(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
