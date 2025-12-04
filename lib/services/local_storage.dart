// lib/services/local_storage.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {

  static Future<void> saveSummary(String articleId, String summary) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("summary_$articleId", summary);
  }

  static Future<String?> getSavedSummary(String articleId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("summary_$articleId");
  }

}
