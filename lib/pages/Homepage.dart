import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_club/api_service/api.dart';
import 'package:movies_club/model/movies.dart';
import 'package:movies_club/constants.dart';
import 'package:movies_club/widgets/movieslider.dart';
import 'package:movies_club/widgets/trendingslider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> serachMovies;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut() async {
    try {
      await _auth.signOut();
      // Navigate to the sign-in page or any other desired page
      // Example:
      Navigator.pushReplacementNamed(context, '/SignIn');
    } catch (e) {
      print('Error signing out: $e');
      // Handle any error that occurred during sign out
    }
  }
    bool _obscureText = true;

  TextEditingController _searchController = TextEditingController();
  List<Movie> searchResults = [];

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      searchMovies(query).then((movies) {
        setState(() {
          searchResults = movies;
        });
      }).catchError((error) {
        print('Error searching movies: $error');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
   
  }

  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            margin: EdgeInsets.only(right: 20),
            height: 48,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              child: TextField(
                controller: _searchController,
                onSubmitted: _performSearch,
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
            ),
            //nav-button
            Padding(
              padding: EdgeInsets.only(top: 490),
              child: GNav(
                  backgroundColor: Color.fromRGBO(67, 96, 115, 1),
                  rippleColor: Color.fromRGBO(67, 96, 115, 1),
                  haptic: true, // haptic feedback
                  tabBorderRadius: 15,
                  tabBorder: Border.all(
                      color: Colors.grey, width: 1), // tab button border
                  tabShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                  ], // tab button shadow
                  curve: Curves.easeOutExpo, // tab animation curves
                  duration:
                      Duration(milliseconds: 900), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: Colors.grey[800], // unselected icon color
                  activeColor: Colors.white, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      Colors.white, // selected tab background color
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  tabs: [
                    GButton(
                      icon: Icons.home_filled,
                      text: 'Home',
                      backgroundColor: Color.fromRGBO(26, 30, 38, 1),
                      onPressed: () {},
                    ),
                    GButton(
                      icon: Icons.bookmark_border,
                      text: 'Watch List',
                      backgroundColor: Color.fromRGBO(26, 30, 38, 1),
                    ),
                    GButton(
                        icon: Icons.person,
                        text: 'profile',
                        backgroundColor: Color.fromRGBO(26, 30, 38, 1),
                        onPressed: () {
                          _signOut();
                        })
                  ]),
            )
          ],
        ),
      ],
    );
  }
}
