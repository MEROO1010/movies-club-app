import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/11?api_key=bb0fb311aa848decc2057b5728d53445'));

  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    return decodedData['results'];
  } else {
    throw Exception('Failed to fetch movies');
  }
}
