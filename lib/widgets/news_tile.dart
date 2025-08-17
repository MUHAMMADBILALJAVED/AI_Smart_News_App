// // lib/widgets/news_tile.dart
// import 'package:flutter/material.dart';

// class NewsTile extends StatelessWidget {
//   final Map<String, dynamic> newsItem;

//   const NewsTile({super.key, required this.newsItem});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, '/detail', arguments: newsItem);
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   newsItem['image'] ?? '',
//                   width: 100,
//                   height: 80,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     width: 100,
//                     height: 80,
//                     color: Colors.grey.shade300,
//                     child: const Icon(Icons.broken_image),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       newsItem['title'] ?? 'No Title',
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textDirection: TextDirection.rtl,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       newsItem['channel'] ?? '',
//                       style: TextStyle(color: Colors.grey[700]),
//                       textDirection: TextDirection.rtl,
//                     ),
//                     const SizedBox(height: 2),
//                     Text(
//                       newsItem['date'] ?? '',
//                       style: TextStyle(color: Colors.grey[500], fontSize: 12),
//                       textDirection: TextDirection.rtl,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// 📁 lib/widgets/news_tile.dart
import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class NewsTile extends StatelessWidget {
  final Map<String, dynamic> newsItem;
  const NewsTile({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(newsItem: newsItem),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  newsItem['image_url'] ?? '',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 100),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      newsItem['title'] ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      newsItem['source'] ?? '',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize:13, color:  Colors.grey[700]),
                    ),
                    Text(
                      newsItem['published_date'] ?? '',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                    ),
                  ],
                  
                ),
                
              ),
              

            ],
              

          ),
            
        ),
        
      ),
    );
  }
}
