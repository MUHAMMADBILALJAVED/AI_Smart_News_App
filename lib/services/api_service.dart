
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String apiUrl = 'https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json'; // Update this IP for your backend

//   static Future<List<dynamic>> fetchNews() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to load news. Status Code: \${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching news: \$e');
//     }
//   }
// }

// Changes Start From Here
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//  static const String jsonUrl = 'https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json';

//  static Future<List<Map<String, dynamic>>> fetchNews() async {
//   final response = await http.get(Uri.parse(jsonUrl));
//   if (response.statusCode == 200) {
//    final List<dynamic> data = json.decode(response.body);
//      return data.cast<Map<String, dynamic>>();
//     } else {
//      throw Exception('Failed to load news from GitHub');
//    }
//   }
// }
// Changes End Here


// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String onlineUrl =
//       "https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json";

//   static Future<List<dynamic>> loadNews() async {
//     try {
//       // Try ONLINE first
//       final response = await http.get(Uri.parse(onlineUrl));

//       if (response.statusCode == 200 && response.body.isNotEmpty) {
//         print("Loaded from ONLINE");
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       print("Online fetch failed → Using local assets");
//     }

//     // Fallback to OFFLINE assets
//     final String jsonString =
//         await rootBundle.loadString("assets/all_articles.json");

//     return jsonDecode(jsonString);
//   }
// }

// lib/services/api_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String onlineUrl = "https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json";

  static Future<List<dynamic>> loadNews() async {
    try {
      final resp = await http.get(Uri.parse(onlineUrl)).timeout(const Duration(seconds: 8));
      if (resp.statusCode == 200 && resp.body.isNotEmpty) {
        final data = jsonDecode(resp.body);
        if (data is List) return data;
      }
    } catch (e) {
      // fallback to local
      print("Online fetch failed: $e");
    }
    // fallback to bundled asset
    try {
      final s = await rootBundle.loadString("assets/all_articles.json");
      final d = jsonDecode(s);
      if (d is List) return d;
    } catch (e) {
      print("Local asset load failed: $e");
    }
    return [];
  }
}
