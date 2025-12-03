// // lib/services/local_storage.dart

// // Yeh file local JSON-like dummy data use karne ke liye banayi gayi hai.
// // Aap isko abhi local development/test ke liye use kar sakte ho,
// // aur baad me asani se API se data lana start kar sakte ho.

// class LocalStorage {
//   static Future<List<Map<String, dynamic>>> fetchLocalNews() async {
//     // Normally, you'd load from a real JSON file or database
//     // For now, static dummy data use ho raha hai (from your breakingnews_details.dart)

//     await Future.delayed(const Duration(seconds: 1)); // mimic network delay

//     return [
//       {
//         "title": "ویمنز ورلڈ کپ تک رسائی، پاکستان ٹیم کی کپتان فاطمہ ثنا کیلیے بڑا اعزاز",
//         "channel": "ARY News",
//         "date": "2025-04-12",
//         "image": "https://images.app.goo.gl/tug3hYSu1erce3f49",
//         // "image": "https://example.com/image1.jpg",
//         "content": " انٹرنیشنل کرکٹ کونسل نے ویمنز کرکٹ ورلڈ کپ کوالیفائر 2025 کے اختتام پر ٹیم آف دی ٹورنامنٹ کا اعلان کر دیا ہے، جس میں چار مختلف ممالک کی بہترین کھلاڑیوں کو شامل کیا گیا ہے۔<br> پاکستان کی باصلاحیت کپتان فاطمہ ثنا کو ٹیم آف دی ٹورنامنٹ کی کپتانی سونپی گئی ہے۔<br> آئی سی سی ویمنز ٹیم آف دی ٹورنامنٹ میں فاطمہ ثنا کے ساتھ پاکستان کی منیبہ علی، نشرا سندھو، سعدیہ اقبال کو بھی شامل کیا گیا ہے۔<br>اوپنرز کی جوڑی میں ہیلی میتھیوز اور منیبہ علی شامل ہیں۔ ویسٹ انڈیز کی ہیلی میتھیوز نے شاندار آل راؤنڈر کارکردگی دکھائی، 240 رنز اور 13 وکٹیں حاصل کرکے وہ نہ صرف ٹورنامنٹ کی ٹاپ وکٹ ٹیکر رہیں بلکہ اپنی ٹیم کو کئی مواقع پر فتح کے قریب بھی پہنچایا۔ ",
//         "summary": "سونے کی قیمت میں اضافہ مہنگائی کے اثرات کی وجہ سے ہے۔"
//       },
//       {
//         "title": "پاکستان کرکٹ ٹیم کا نیا کوچ مقرر",
//         "channel": "Geo News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image2.jpg",
//         "content": "پاکستان کرکٹ بورڈ نے نئے کوچ کا اعلان کر دیا ہے جو اگلی سیریز میں ٹیم کی قیادت کریں گے۔",
//         "summary": "نیا کوچ ٹیم کی پرفارمنس بہتر بنانے کی کوشش کرے گا۔"
//       },
//       {
//         "title": "تعلیمی اداروں میں گرمیوں کی چھٹیوں کا اعلان",
//         "channel": "Jang News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image3.jpg",
//         "content": "وزارت تعلیم نے جون اور جولائی کے مہینے میں تمام اسکولوں کو بند رکھنے کا اعلان کر دیا ہے۔",
//         "summary": "چھٹیوں کا فیصلہ موسم گرما کی شدت کے پیش نظر کیا گیا ہے۔"
//       },
//       {
//         "title": "تعلیمی اداروں میں گرمیوں کی چھٹیوں کا اعلان",
//         "channel": "Jang News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image3.jpg",
//         "content": "وزارت تعلیم نے جون اور جولائی کے مہینے میں تمام اسکولوں کو بند رکھنے کا اعلان کر دیا ہے۔",
//         "summary": "چھٹیوں کا فیصلہ موسم گرما کی شدت کے پیش نظر کیا گیا ہے۔"
//       },
//       {
//         "title": "تعلیمی اداروں میں گرمیوں کی چھٹیوں کا اعلان",
//         "channel": "Jang News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image3.jpg",
//         "content": "وزارت تعلیم نے جون اور جولائی کے مہینے میں تمام اسکولوں کو بند رکھنے کا اعلان کر دیا ہے۔",
//         "summary": "چھٹیوں کا فیصلہ موسم گرما کی شدت کے پیش نظر کیا گیا ہے۔"
//       },
//       {
//         "title": " ’پوری سیریز میں کہیں جیت کی لگن دکھائی نہیں دی‘: نیوزی لینڈ نے ون ڈے سیریز میں پاکستان کو ’وائٹ واش‘ کر دیا' ",
//         "channel": "Jang News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image3.jpg",
//         "content": "وزارت تعلیم نے جون اور جولائی کے مہینے میں تمام اسکولوں کو بند رکھنے کا اعلان کر دیا ہے۔",
//         "summary": "چھٹیوں کا فیصلہ موسم گرما کی شدت کے پیش نظر کیا گیا ہے۔"
//       },
//       {
//         "title": "تعلیمی اداروں میں گرمیوں کی چھٹیوں کا اعلان",
//         "channel": "Jang News",
//         "date": "2025-04-12",
//         "image": "https://example.com/image3.jpg",
//         "content": "وزارت تعلیم نے جون اور جولائی کے مہینے میں تمام اسکولوں کو بند رکھنے کا اعلان کر دیا ہے۔",
//         "summary": "چھٹیوں کا فیصلہ موسم گرما کی شدت کے پیش نظر کیا گیا ہے۔"
//       },
//     ];
//   }
// }

//import 'dart:convert';
//import 'package:flutter/services.dart';

//class LocalStorage {
//  static Future<List<Map<String, dynamic>>> fetchLocalNews() async {
//    final String response = await rootBundle.loadString('assets/all_articles.json');
//    final List<dynamic> data = json.decode(response);
//    return data.cast<Map<String, dynamic>>();
//  }
//}

// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalService {

//   static Future<void> saveSummary(String articleId, String summary) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString("summary_$articleId", summary);
//   }

//   static Future<String?> getSavedSummary(String articleId) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString("summary_$articleId");
//   }

// }
// lib/services/local_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static Future<void> saveSummary(String articleId, String summary) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('summary_$articleId', summary);
  }

  static Future<String?> getSavedSummary(String articleId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('summary_$articleId');
  }
}
