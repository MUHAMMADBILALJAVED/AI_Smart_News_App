
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

//import 'dart:convert';
//import 'package:http/http.dart' as http;

//class ApiService {
//  static const String jsonUrl = 'https://raw.githubusercontent.com/yousafumer/news-scraper-project/main/all_articles.json';

//  static Future<List<Map<String, dynamic>>> fetchNews() async {
//    final response = await http.get(Uri.parse(jsonUrl));
//    if (response.statusCode == 200) {
//      final List<dynamic> data = json.decode(response.body);
//      return data.cast<Map<String, dynamic>>();
//    } else {
//      throw Exception('Failed to load news from GitHub');
//    }
//  }
//}

import 'dart:convert';
import 'package:http/http.dart' as http;

class SummarizerAPI {
  final String token = "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";

  Future<String> generateSummary(String article) async {
    final url = Uri.parse(
        "https://api-inference.huggingface.co/models/yousaf23/mt5-base-urdu-summarizer");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "inputs": article,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data is List && data.isNotEmpty && data[0]["generated_text"] != null) {
        return data[0]["generated_text"];
      } else {
        return "Error: Summary not generated.";
      }
    } else {
      return "API Error: ${response.statusCode}";
    }
  }
}