// import 'package:flutter/material.dart';
// import '../screens/detail_screen.dart';

// class HomeSlider extends StatefulWidget {
//   final List<Map<String, dynamic>> newsList;
//   const HomeSlider({super.key, required this.newsList, required newsItem});

//   @override
//   State<HomeSlider> createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider> {
//   late final PageController _pageController;
//   int _pageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.85);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.newsList.length,
//         itemBuilder: (context, index) {
//           final item = widget.newsList[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => DetailScreen(newsItem: item)),
//             ),
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: NetworkImage(item['image'] ?? ''),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black87, Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(item['channel'] ?? '',
//                         style: const TextStyle(color: Colors.white)),
//                     const SizedBox(height: 6),
//                     Text(item['title'] ?? '',
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18)),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// lib/widgets/home_slider.dart
// import 'package:flutter/material.dart';
// import '../screens/detail_screen.dart';

// class HomeSlider extends StatefulWidget {
//   final List<Map<String, dynamic>> newsList;
//   const HomeSlider({super.key, required this.newsList});

//   @override
//   State<HomeSlider> createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider> {
//   late final PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.85);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.newsList.length,
//         itemBuilder: (context, index) {
//           final item = widget.newsList[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => DetailScreen(newsItem: item),
//               ),
//             ),
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: NetworkImage(item['image'] ?? ''),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black87, Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item['channel'] ?? '',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       item['title'] ?? '',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// lib/widgets/horizontal_news_slider.dart
import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class HorizontalNewsSlider extends StatelessWidget {
  final List<Map<String, dynamic>> newsList;
  const HorizontalNewsSlider({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final newsItem = newsList[index];
          return GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(newsItem: newsItem),
                  ),
                ),
            child: Container(
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(newsItem['image_url'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      newsItem['source'] ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      newsItem['title'] ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
