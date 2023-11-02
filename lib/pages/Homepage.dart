import 'package:flutter/material.dart';
import 'package:movies_club/model/fetch_movies.dart';
import 'package:movies_club/model/movies.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = Movie.fromJson(movies[index]);
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                  leading: Image.network(movie.posterUrl),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
