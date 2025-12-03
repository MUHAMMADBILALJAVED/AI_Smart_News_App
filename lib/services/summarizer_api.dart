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

// Changes Start Here

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SummarizerAPI {

//   final String token = "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";  

//   Future<String> generateSummary(String article) async {

//     final url = Uri.parse(
//       "https://api-inference.huggingface.co/models/yousaf23/mt5-base-urdu-summarizer"
//     );

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

//       if (data is List &&
//           data.isNotEmpty &&
//           data[0]["generated_text"] != null) {
//         return data[0]["generated_text"];
//       } else {
//         return "⚠️ Error: Summary not generated.";
//       }
//     } else {
//       return "API Error: ${response.statusCode}";
//     }
//   }
// }


// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SummarizerAPI {
//   final String baseUrl =
//       "https://yousaf23-final-summarizer-api.hf.space/gradio_api/call/summarize_text";

//   Future<String> generateSummary(String article, content) async {
//     try {
//       // ---------------------------
//       // 1️⃣ POST request → returns event_id
//       // ---------------------------
//       final postResponse = await http.post(
//         Uri.parse(baseUrl),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "data": [article]
//         }),
//       );

//       print("POST STATUS: ${postResponse.statusCode}");
//       print("POST BODY: ${postResponse.body}");

//       if (postResponse.statusCode != 200) {
//         return "❌ POST API Error: ${postResponse.statusCode}";
//       }

//       final decoded = jsonDecode(postResponse.body);
//       final eventId = decoded["event_id"];

//       if (eventId == null) {
//         return "❌ Event ID not found!";
//       }

//       print("EVENT ID: $eventId");

//       // ---------------------------
//       // 2️⃣ GET request → (SSE stream)
//       // ---------------------------
//       final getUrl = "$baseUrl/$eventId";
//       final getResponse = await http.get(Uri.parse(getUrl));

//       print("GET STATUS: ${getResponse.statusCode}");
//       print("GET BODY: ${getResponse.body}");

//       if (getResponse.statusCode != 200) {
//         return "❌ GET API Error: ${getResponse.statusCode}";
//       }

//       // ---------------------------
//       // FIX: Parse SSE (NOT JSON)
//       // ---------------------------
//       final lines = getResponse.body.split("\n");

//       String? summary;

//       for (var line in lines) {
//         line = line.trim();

//         if (line.startsWith("data:")) {
//           final jsonString = line.replaceFirst("data:", "").trim();

//           // ignore heartbeat
//           if (jsonString == "null" || jsonString.isEmpty) continue;

//           try {
//             final parsed = jsonDecode(jsonString);
//             if (parsed is List && parsed.isNotEmpty) {
//               summary = parsed[0].toString();
//             }
//           } catch (e) {
//             // ignore non-JSON data
//           }
//         }
//       }

//       return summary ?? "⚠️ خلاصہ نہیں ملا۔";

//     } catch (e) {
//       print("🔥 ERROR: $e");
//       return "❌ نیٹ ورک خرابی: $e";
//     }
//   }
// }

// lib/services/summarizer_api.dart
import 'dart:convert';
import 'package:ai_smart_news_app/services/local_storage.dart';
import 'package:http/http.dart' as http;

class SummarizerAPI {
  // Replace token with your actual HF token or use backend proxy in prod
  final String token = "hf_your_token_here";

  Future<String> generateSummary(String articleId, String articleText) async {
    final cached = await LocalService.getSavedSummary(articleId);
    if (cached != null && cached.isNotEmpty) return cached;

    try {
      final url = Uri.parse("https://api-inference.huggingface.co/models/yousaf23/mt5-base-urdu-summarizer");
      final resp = await http.post(url,
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
          body: jsonEncode({"inputs": articleText}))
          .timeout(const Duration(seconds: 20));
      if (resp.statusCode == 200 && resp.body.isNotEmpty) {
        final decoded = jsonDecode(resp.body);
        if (decoded is List && decoded.isNotEmpty && decoded[0]["generated_text"] != null) {
          final summary = decoded[0]["generated_text"] as String;
          await LocalService.saveSummary(articleId, summary);
          return summary;
        }
      }
      return "خلاصہ دستیاب نہیں۔";
    } catch (e) {
      print("Summarizer error: $e");
      return "خلاصہ حاصل کرنے میں مسئلہ۔";
    }
  }
}
