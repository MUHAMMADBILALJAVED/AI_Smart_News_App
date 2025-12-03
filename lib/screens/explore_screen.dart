// // lib/screens/explore_screen.dart
// import 'package:flutter/material.dart';
// import '../widgets/news_tile.dart';
// import '../services/api_service.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   late Future<List<dynamic>> newsList;
//   String selectedCategory = 'All';
//   String searchQuery = '';

//   final List<String> categories = [
//     'All', 'Politics', 'Sports', 'Tech', 'Business', 'World', 'Entertainment'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     newsList = ApiService.fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explore News'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (value) => setState(() => searchQuery = value),
//               decoration: InputDecoration(
//                 hintText: 'Search here...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             SizedBox(
//               height: 40,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 separatorBuilder: (context, index) => const SizedBox(width: 8),
//                 itemBuilder: (context, index) {
//                   final category = categories[index];
//                   final isSelected = selectedCategory == category;
//                   return ChoiceChip(
//                     label: Text(category),
//                     selected: isSelected,
//                     onSelected: (_) {
//                       setState(() => selectedCategory = category);
//                     },
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: FutureBuilder<List<dynamic>>(
//                 future: newsList,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: \${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No news found'));
//                   } else {
//                     final filteredNews = snapshot.data!.where((item) {
//                       final matchesCategory = selectedCategory == 'All' ||
//                           (item['category']?.toString().toLowerCase() ?? '') ==
//                               selectedCategory.toLowerCase();
//                       final matchesSearch = item['title']
//                               ?.toString()
//                               .toLowerCase()
//                               .contains(searchQuery.toLowerCase()) ??
//                           false;
//                       return matchesCategory && matchesSearch;
//                     }).toList();

//                     if (filteredNews.isEmpty) {
//                       return const Center(child: Text('No matching results.'));
//                     }

//                     return ListView.builder(
//                       itemCount: filteredNews.length,
//                       itemBuilder: (context, index) {
//                         //return NewsTile(newsItem: filteredNews[index]);
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// lib/screens/explore_screen.dart
// Changes Start from here 
// import 'package:flutter/material.dart';
// import '../widgets/news_tile.dart';
// import '../services/api_service.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   late Future<List<Map<String, dynamic>>> newsList;
//   String selectedCategory = 'All';
//   final List<String> categories = ['All', 'BBC News', 'ARY News', 'Express News'];

//   @override
//   void initState() {
//     super.initState();
//     newsList = ApiService.fetchNews();
//   }

//   List<Map<String, dynamic>> filterNews(List<Map<String, dynamic>> data) {
//     if (selectedCategory == 'All') return data;
//     return data.where((item) => item['source'] == selectedCategory).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explore News'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
// Changes End Here
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

// Changes Start from here          
//           SizedBox(
//             height: 42,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 final category = categories[index];
//                 final isSelected = category == selectedCategory;
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 8),
//                   child: 
//                   ChoiceChip(
//                     label: Text(category),
//                     selected: isSelected,
//                     onSelected: (_) => setState(() => selectedCategory = category),
//                     selectedColor: Colors.green,
//                     labelStyle: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 12),
//           Expanded(
//             child: FutureBuilder<List<Map<String, dynamic>>>(
//               future: newsList,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 final filteredData = filterNews(snapshot.data!);
//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   itemCount: filteredData.length,
//                   itemBuilder: (context, index) => NewsTile(newsItem: filteredData[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// Changes End Here

// lib/screens/explore_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/news_tile.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<dynamic>> newsFuture;
  String selected = 'All';
  final List<String> categories = ['All', 'Geo News', 'ARY News', 'BBC News', 'Express News'];

  @override
  void initState() {
    super.initState();
    newsFuture = ApiService.loadNews();
  }

  List<dynamic> filter(List<dynamic> all) {
    if (selected == 'All') return all;
    return all.where((it) => (it['channel'] ?? '').toString().toLowerCase() == selected.toLowerCase()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.green[700],
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search here...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    ),
                    onChanged: (v) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((c) {
                        final sel = c == selected;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: ChoiceChip(
                            label: Text(c),
                            selected: sel,
                            onSelected: (_) => setState(() => selected = c),
                            selectedColor: Colors.greenAccent,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: newsFuture,
                builder: (context, snap) {
                  if (!snap.hasData) return const Center(child: CircularProgressIndicator());
                  final data = filter(snap.data!);
                  if (data.isEmpty) return const Center(child: Text("No articles found"));
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: data.length,
                    itemBuilder: (context, i) => NewsTile(newsItem: data[i]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
