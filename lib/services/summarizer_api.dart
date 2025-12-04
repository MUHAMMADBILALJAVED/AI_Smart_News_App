// lib/services/summarizer_api.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

class SummarizerAPI {
  final String baseUrl =
      "https://yousaf23-final-summarizer-api.hf.space/gradio_api/call/summarize_text";

  Future<String> generateSummary(String article) async {
    try {
      // ---------------------------
      // 1️⃣ POST request → returns event_id
      // ---------------------------
      final postResponse = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "data": [article]
        }),
      );

      print("POST STATUS: ${postResponse.statusCode}");
      print("POST BODY: ${postResponse.body}");

      if (postResponse.statusCode != 200) {
        return "❌ POST API Error: ${postResponse.statusCode}";
      }

      final decoded = jsonDecode(postResponse.body);
      final eventId = decoded["event_id"];

      if (eventId == null) {
        return "❌ Event ID not found!";
      }

      print("EVENT ID: $eventId");

      // ---------------------------
      // 2️⃣ GET request → (SSE stream)
      // ---------------------------
      final getUrl = "$baseUrl/$eventId";
      final getResponse = await http.get(Uri.parse(getUrl));

      print("GET STATUS: ${getResponse.statusCode}");
      print("GET BODY: ${getResponse.body}");

      if (getResponse.statusCode != 200) {
        return "❌ GET API Error: ${getResponse.statusCode}";
      }

      // ---------------------------
      // FIX: Parse SSE (NOT JSON)
      // ---------------------------
      final lines = getResponse.body.split("\n");

      String? summary;

      for (var line in lines) {
        line = line.trim();

        if (line.startsWith("data:")) {
          final jsonString = line.replaceFirst("data:", "").trim();

          // ignore heartbeat
          if (jsonString == "null" || jsonString.isEmpty) continue;

          try {
            final parsed = jsonDecode(jsonString);
            if (parsed is List && parsed.isNotEmpty) {
              summary = parsed[0].toString();
            }
          } catch (e) {
            // ignore non-JSON data
          }
        }
      }

      return summary ?? "⚠️ خلاصہ نہیں ملا۔";

    } catch (e) {
      print("🔥 ERROR: $e");
      return "❌ نیٹ ورک خرابی: $e";
    }
  }
}
