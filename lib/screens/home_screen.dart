// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:ai_smart_news_app/services/api_service.dart';
import '../widgets/home_slider.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> newsList;
  
  @override
  void initState() {
    super.initState();
    newsList = ApiService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Smart Press'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news found'));
          } else {
            final data = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const SizedBox(height: 10),
                HorizontalNewsSlider(newsList: data),
                const SizedBox(height: 20),
                const Text(
                  'حالیہ خبریں',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 12),
                ...data.map((item) => NewsTile(newsItem: item)).toList(),
              ],
            );
          }
        },
      ),
    );
  }
}