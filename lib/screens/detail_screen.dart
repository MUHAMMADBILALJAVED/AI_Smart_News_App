// lib/services/detail_screen.dart
import 'package:ai_smart_news_app/services/summarizer_api.dart';
import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> newsItem;

  const DetailScreen({super.key, required this.newsItem});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLoading = false;
  String summaryText = "";

  Future<void> generateAndShowSummary() async {
  final article = widget.newsItem['article'] ?? '';

  if (article.isEmpty || article.length < 40) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("❌ متن بہت چھوٹا ہے خلاصہ کے لیے")),
    );
    return;
  }

  setState(() => isLoading = true);

  try {
    final api = SummarizerAPI();

    // 🔥 Call HF Space API
    final result = await api.generateSummary(article);

    // 🔥 Save summary in state
    setState(() => summaryText = result);

    // 🔥 Show popup dialog
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "📄 خلاصہ",
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Text(
              summaryText,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          actions: [
            TextButton(
              child: Text("بند کریں"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("❌ خرابی: $e")),
    );
  } finally {
    setState(() => isLoading = false);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsItem['source'] ?? 'News Channel'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.picture_as_pdf), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.newsItem['title'] ?? 'خبر کا عنوان',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.newsItem['image_url'] ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.newsItem['published_date'] ?? '',
                  style: const TextStyle(color: Colors.grey),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.newsItem['article'] ?? 'خبر کی مکمل تفصیل یہاں ظاہر ہوگی۔',
                  style: const TextStyle(fontSize: 18, height: 1.6),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 80), // Bottom space for FAB
              ],
            ),
          ),
          
          // Floating Action Buttons
          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'audioBtn',
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.volume_up),
                ),
                const SizedBox(height: 12),
                FloatingActionButton(
                  heroTag: 'summaryBtn',
                  onPressed: isLoading ? null : generateAndShowSummary,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.summarize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
