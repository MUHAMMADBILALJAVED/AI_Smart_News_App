// lib/screens/explore_screen.dart
import 'package:flutter/material.dart';
import '../widgets/news_tile.dart';
import '../services/api_service.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<Map<String, dynamic>>> newsList;
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'BBC News', 'ARY News', 'Express News'];

  @override
  void initState() {
    super.initState();
    newsList = ApiService.fetchNews();
  }

  List<Map<String, dynamic>> filterNews(List<Map<String, dynamic>> data) {
    if (selectedCategory == 'All') return data;
    return data.where((item) => item['source'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore News'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ************ Search Bar ************
          // Padding(
          //   padding: const EdgeInsets.all(12),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'خبریں تلاش کریں',
          //       prefixIcon: const Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: 
                  ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) => setState(() => selectedCategory = category),
                    selectedColor: Colors.green,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: newsList,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final filteredData = filterNews(snapshot.data!);
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) => NewsTile(newsItem: filteredData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
