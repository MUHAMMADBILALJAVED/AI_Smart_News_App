// lib/services/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
 static const String jsonUrl = 'https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json';

 static Future<List<Map<String, dynamic>>> fetchNews() async {
  final response = await http.get(Uri.parse(jsonUrl));
  if (response.statusCode == 200) {
   final List<dynamic> data = json.decode(response.body);
     return data.cast<Map<String, dynamic>>();
    } else {
     throw Exception('Failed to load news from GitHub');
   }
  }
}
