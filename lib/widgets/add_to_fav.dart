// lib/services/favorite_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String key = "favorite_articles";

  static Future<void> addFavorite(Map<String, dynamic> article) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(key) ?? <String>[];
    // prevent duplicates by id (use 'id' field)
    final id = article['id']?.toString() ?? article['title'].toString();
    list.removeWhere((e) => jsonDecode(e)['id']?.toString() == id);
    list.add(jsonEncode(article));
    await prefs.setStringList(key, list);
  }

  static Future<void> removeFavorite(String articleId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(key) ?? <String>[];
    list.removeWhere((e) => jsonDecode(e)['id']?.toString() == articleId);
    await prefs.setStringList(key, list);
  }

  static Future<List<Map<String, dynamic>>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(key) ?? <String>[];
    return list.map((e) => Map<String, dynamic>.from(jsonDecode(e))).toList();
  }
}
