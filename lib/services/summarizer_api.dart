// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SummarizerAPI {
//   final String token = "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";

//   Future<String> generateSummary(String article) async {
//     final url = Uri.parse(
//         "https://api-inference.huggingface.co/models/yousaf23/mt5-base-urdu-summarizer");

//     final response = await http.post(
//       url,
//       headers: {
//         "Authorization": "Bearer $token",
//         "Content-Type": "application/json"
//       },
//       body: jsonEncode({
//         "inputs": article,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       if (data is List && data.isNotEmpty && data[0]["generated_text"] != null) {
//         return data[0]["generated_text"];
//       } else {
//         return "Error: Summary not generated.";
//       }
//     } else {
//       return "API Error: ${response.statusCode}";
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class SummarizerAPI {

  final String token = "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";  

  Future<String> generateSummary(String article) async {

    final url = Uri.parse(
      "https://api-inference.huggingface.co/models/yousaf23/mt5-base-urdu-summarizer"
    );

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

      if (data is List &&
          data.isNotEmpty &&
          data[0]["generated_text"] != null) {
        return data[0]["generated_text"];
      } else {
        return "⚠️ Error: Summary not generated.";
      }
    } else {
      return "API Error: ${response.statusCode}";
    }
  }
}
