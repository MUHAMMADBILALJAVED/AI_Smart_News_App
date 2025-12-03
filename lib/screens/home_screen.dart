// // import 'package:flutter/material.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }

// // lib/screens/home_screen.dart
// // import 'package:flutter/material.dart';
// // import '../widgets/news_tile.dart';
// // import '../services/api_service.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   late Future<List<dynamic>> newsList;

// //   @override
// //   void initState() {
// //     super.initState();
// //     //newsList = ApiService.fetchNews(); // replace with your local JSON function if testing
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('AI Smart Press App'),
// //         centerTitle: true,
// //       ),
// //       body: FutureBuilder<List<dynamic>>(
// //         future: newsList,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: \${snapshot.error}'));
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             return const Center(child: Text('No news found'));
// //           } else {
// //             final news = snapshot.data!;
// //             return ListView.builder(
// //               padding: const EdgeInsets.all(12),
// //               itemCount: news.length,
// //               itemBuilder: (context, index) {
// //                 return NewsTile(newsItem: news[index]);
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             HomeTopBottons(),
//             HomeHeading(
//               title: 'Breaking News',
//               trailing: TextButton(
//                 onPressed: null,
//                 child: Text('See all'),
//               ),
//             ),
//             HomeSlider(),
//             HomeHeading(
//               title: 'Recommendation',
//               trailing: TextButton(
//                 onPressed: null,
//                 child: Text('See all'),
//               ),
//             ),
//             NewsList(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // HomeTopBottons
// class HomeTopBottons extends StatelessWidget {
//   const HomeTopBottons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       sliver: SliverToBoxAdapter(
//         child: Row(
//           children: [
//             CircleAvatar(
//               child: Image.asset("Fiverr_logo.png"),
//             ),
//             const SizedBox(width: 10),
//             const Text(
//               'SmartNews App',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
//               ),
//             ),
//             const Spacer(),
//             Material(
//               color: const Color.fromARGB(255, 231, 231, 231),
//               borderRadius: BorderRadius.circular(50),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(50),
//                 onTap: () {},
//                 child: const SizedBox(
//                   width: 30,
//                   height: 30,
//                   child: Icon(
//                     Icons.notifications_outlined,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // HomeHeading
// class HomeHeading extends StatelessWidget {
//   final String title;
//   final Widget? trailing;

//   const HomeHeading({super.key, required this.title, this.trailing});

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
//       sliver: SliverToBoxAdapter(
//         child: Row(
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             if (trailing != null) trailing!,
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Home Slider
// class HomeSlider extends StatefulWidget {
//   const HomeSlider({super.key});

//   @override
//   State<HomeSlider> createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider> {
//   late final PageController _pageController;
//   int _pageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           SizedBox(
//             height: 210,
//             child: PageView.builder(
//               onPageChanged: (value) {
//                 setState(() {
//                   _pageIndex = value % newsItems.length;
//                 });
//               },
//               controller: _pageController,
//               itemBuilder: (context, index) {
//                 final i = index % newsItems.length;
//                 return HomeSliderItem(
//                   isActive: _pageIndex == i,
//                   imageAssetPath: newsItems[i]['imageAssetPath']!,
//                   authorImageAssetPath: newsItems[i]['authorImageAssetPath']!,
//                   category: newsItems[i]['category']!,
//                   author: newsItems[i]['author']!,
//                   title: newsItems[i]['title']!,
//                   content: newsItems[i]['content']!,
//                   // date: DateTime.parse(newsItems[i]['date']!),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeSliderItem extends StatelessWidget {
//   final bool isActive;
//   final String imageAssetPath;
//   final String authorImageAssetPath;
//   final String category;
//   final String author;
//   final String title;
//   final String content;
//   // final DateTime date;

//   const HomeSliderItem({
//     super.key,
//     required this.isActive,
//     required this.imageAssetPath,
//     required this.authorImageAssetPath,
//     required this.category,
//     required this.title,
//     required this.content,
//     // required this.date,
//     required this.author,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SingleNewsItem(
//               title: title,
//               content: content,
//               author: author,
//               category: category,
//               authorImageAssetPath: authorImageAssetPath,
//               imageAssetPath: imageAssetPath,
//             ),
//           ),
//         );
//       },
//       child: FractionallySizedBox(
//         widthFactor: 1.05,
//         child: AnimatedScale(
//           duration: const Duration(milliseconds: 400),
//           scale: isActive ? 1 : 0.8,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: [
//                 Container(
//                   color: Colors.green,
//                 ),
//                 Image.asset(
//                   imageAssetPath,
//                   fit: BoxFit.cover,
//                   width: double.maxFinite,
//                   height: double.maxFinite,
//                 ),
//                 Positioned(
//                   top: 10,
//                   left: 10,
//                   child: Chip(
//                     label: Text(
//                       category,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color(0xCC000000),
//                         Color(0x99000000),
//                         Color(0x00000000),
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         author,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         maxLines: 1,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // NewsList
// class NewsList extends StatelessWidget {
//   const NewsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (content, i) => NewsListItems(
//           imageAssetPath: newsItems[i]['imageAssetPath']!,
//           authorImageAssetPath: newsItems[i]['authorImageAssetPath']!,
//           category: newsItems[i]['category']!,
//           author: newsItems[i]['author']!,
//           title: newsItems[i]['title']!,
//           content: newsItems[i]['content']!,
//           //date: DateTime.parse(newsItems[i]['date']!),
//         ),
//         childCount: newsItems.length,
//       ),
//     );
//   }
// }

// // class NewsListItems extends StatelessWidget {
// //   final String title;
// //   final String author;
// //   final String category;
// //   final String authorImageAssetPath;
// //   final String imageAssetPath;
// //   //final DateTime date;

// //   const NewsListItems(
// //     {
// //       super.key,
// //       required this.title,
// //       required this.author,
// //       required this.category,
// //       required this.authorImageAssetPath,
// //       required this.imageAssetPath,
// //       //required this.date
// //     }
// //   );

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
// //       child: Container(
// //         padding: const EdgeInsets.all(15),
// //         decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(20),
// //           gradient: const LinearGradient(
// //             colors: [
// //               Color.fromARGB(204, 0, 100, 0),
// //               Color.fromARGB(153, 0, 100, 0),
// //               Color.fromARGB(0, 0, 100, 0),
// //             ],
// //             begin: Alignment.bottomCenter,
// //             end: Alignment.topCenter,
// //           ),
// //         ),
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(20),
// //               child: Image.asset(
// //                 imageAssetPath,
// //                 width: 120,
// //                 height: 120,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             const SizedBox(width: 10),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     category,
// //                     style: const TextStyle(
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 6),
// //                   Text(
// //                     title,
// //                     style: const TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Row(
// //                     children: [
// //                       CircleAvatar(
// //                         backgroundImage: AssetImage(authorImageAssetPath),
// //                         radius: 15,
// //                       ),
// //                       const SizedBox(width: 8),
// //                       Text(author),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class NewsListItems extends StatelessWidget {
//   final String title;
//   final String content;
//   final String author;
//   final String category;
//   final String authorImageAssetPath;
//   final String imageAssetPath;
//   //final DateTime date;

//   const NewsListItems({
//     super.key,
//     required this.title,
//     required this.content,
//     required this.author,
//     required this.category,
//     required this.authorImageAssetPath,
//     required this.imageAssetPath,
//     //required this.date
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SingleNewsItem(
//               title: title,
//               content: content,
//               author: author,
//               category: category,
//               authorImageAssetPath: authorImageAssetPath,
//               imageAssetPath: imageAssetPath,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: const LinearGradient(
//             colors: [
//               Color.fromARGB(204, 0, 100, 0),
//               Color.fromARGB(153, 0, 100, 0),
//               Color.fromARGB(0, 0, 100, 0),
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 imageAssetPath,
//                 width: 120,
//                 height: 120,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     category,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage(authorImageAssetPath),
//                         radius: 15,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         author,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 📁 lib/screens/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:smart_news_app/services/local_storage.dart';
// import 'package:smart_news_app/widgets/home_slider.dart';
// import 'package:smart_news_app/widgets/news_tile.dart';

// class HomeScreen extends StatefulWidget {
//   //final List<Map<String, dynamic>> newsList; // ✅ full list of articles
//   const HomeScreen({super.key,});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<dynamic>> newsList;

//   @override
//   void initState() {
//     super.initState();
//     newsList = LocalStorage.fetchLocalNews(); // or ApiService.fetchNews()
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('AI Smart Press')),
//       body: FutureBuilder<List<dynamic>>(
//         future: newsList,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final data = snapshot.data!;
//           return ListView(
//             children: [
//               HorizontalNewsSlider(newsList: []), // ✅ Yeh sahi tareeqa hai
//               const SizedBox(height: 12),
//               ...data.map((item) => NewsTile(newsItem: item)).toList(), // ✅ Vertical card k ly
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


// lib/screens/home_screen.dart
// Changes Start From Here
// import 'package:flutter/material.dart';
// import 'package:ai_smart_news_app/services/api_service.dart';
// import '../widgets/home_slider.dart';
// import '../widgets/news_tile.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Map<String, dynamic>>> newsList;
  
//   @override
//   void initState() {
//     super.initState();
//     newsList = ApiService.fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AI Smart Press'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: newsList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: \${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No news found'));
//           } else {
//             final data = snapshot.data!;
//             return ListView(
//               padding: const EdgeInsets.all(12),
//               children: [
//                 const SizedBox(height: 10),
//                 HorizontalNewsSlider(newsList: data),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'حالیہ خبریں',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 const SizedBox(height: 12),
//                 ...data.map((item) => NewsTile(newsItem: item)).toList(),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// Changes End Here


// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:ai_smart_news_app/services/api_service.dart';
// import '../widgets/home_slider.dart';
// import '../widgets/news_tile.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<dynamic>> newsList;

//   @override
//   void initState() {
//     super.initState();
//     newsList = ApiService.fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("AI Smart Press"),
//         centerTitle: true,
//         backgroundColor: Colors.green[800],
//       ),

//       body: FutureBuilder<List<dynamic>>(
//         future: newsList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 "Error loading news\n${snapshot.error}",
//                 textAlign: TextAlign.center,
//               ),
//             );
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No news available"));
//           }

//           final data = snapshot.data! as List<Map<String, dynamic>>;

//           return ListView(
//             children: [
//               HorizontalNewsSlider(newsList: data),
//               const SizedBox(height: 12),
//               ...data.map((item) => NewsTile(newsItem: item)).toList(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/home_slider.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = ApiService.loadNews();
  }

  List<dynamic> _todayOnly(List<dynamic> all) {
    final now = DateTime.now();
    return all.where((item) {
      try {
        final d = DateTime.parse(item['date'].toString());
        return d.year == now.year && d.month == now.month && d.day == now.day;
      } catch (_) {
        // if parse fails, include by default
        return false;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Smart Press"),
        backgroundColor: Colors.green[800],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: newsFuture,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
          final data = snap.data ?? [];
          final today = _todayOnly(data);
          if (today.isEmpty) return const Center(child: Text("آج کے لیے خبریں موجود نہیں"));
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              HomeSlider(newsList: today),
              const SizedBox(height: 12),
              const Text("NEWS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...today.map((item) => NewsTile(newsItem: item)).toList(),
            ],
          );
        },
      ),
    );
  }
}


    // return Scaffold(

    //   appBar: AppBar(
    //     title: const Text('AI Smart Press'),
    //     centerTitle: true,
    //   ),

    //   body: Padding(
    //     padding: const EdgeInsets.all(12),
    //     child: FutureBuilder<List<dynamic>>(
    //       future: newsList,
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(child: CircularProgressIndicator());
    //         } else if (snapshot.hasError) {
    //           return Center(child: Text('Error: \${snapshot.error}'));
    //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //           return const Center(child: Text('No news found'));
    //         } else {
    //           final news = snapshot.data!;
    //           return ListView.builder(
    //             itemCount: news.length,
    //             itemBuilder: (context, index) => HomeSlider(newsItem: news[index], newsList: [],),
    //           );
    //         }
    //       },
    //     ),
    //   ),
    // );
  // }
// }

