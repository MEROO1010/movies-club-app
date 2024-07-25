import 'package:flutter/material.dart';
import 'package:movies_club/api_service/api.dart';
import 'package:movies_club/model/movie.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  List<Movie> _movies = [];

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
        Expanded(
          child: ListView.builder(
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              final movie = _movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
                leading: Image.network(movie.posterPath),
              );
            },
          ),
        ),
      ],
    );
  }
}
