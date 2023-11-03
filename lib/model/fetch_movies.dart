import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchMovies() async {
  final response = await http.get(Uri.parse('api key'));

  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    return decodedData['results'];
  } else {
    throw Exception('Failed to fetch movies');
  }
}
