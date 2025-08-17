// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const DetailScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(newsItem['source'] ?? 'News Channel'),
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
                  newsItem['title'] ?? 'خبر کا عنوان',
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
                    newsItem['image_url'] ?? '',
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
                  newsItem['published_date'] ?? '',
                  style: const TextStyle(color: Colors.grey),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 16),
                Text(
                  newsItem['article'] ?? 'خبر کی مکمل تفصیل یہاں ظاہر ہوگی۔',
                  style: const TextStyle(fontSize: 18, height: 1.6),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 24),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Summary button action here (to be implemented)
                //   },
                //   icon: const Icon(Icons.summarize),
                //   label: const Text("خلاصہ دیکھیں"),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.primary,
                //     foregroundColor: Colors.white,
                //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              children: [
                const SizedBox(width: 12),
                FloatingActionButton(
                  heroTag: 'audioBtn',
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.volume_up),
                ),
                const SizedBox(height: 12),
                FloatingActionButton(
                  heroTag: 'summaryBtn',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white.withOpacity(0.95),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("خلاصہ", style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              // const Text("['summary'] ?? 'خلاصہ دستیاب نہیں')"),
                              const SizedBox(height: 12),
                              ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                label: const Text("بند کریں"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.summarize),
                ),
              ],
            ),
          )

        ],
      ),

      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Text(
      //         newsItem['title'] ?? 'خبر کا عنوان',
      //         style: const TextStyle(
      //           fontSize: 22,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         textDirection: TextDirection.rtl,
      //       ),
      //       const SizedBox(height: 12),
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(12),
      //         child: Image.network(
      //           newsItem['image_url'] ?? '',
      //           height: 200,
      //           width: double.infinity,
      //           fit: BoxFit.cover,
      //           errorBuilder: (context, error, stackTrace) => Container(
      //             height: 200,
      //             color: Colors.grey.shade300,
      //             child: const Icon(Icons.broken_image),
      //           ),
      //         ),
              
      //       ),
      //       const SizedBox(height: 10),
      //       Text(
      //         newsItem['published_date'] ?? '',
      //         style: const TextStyle(color: Colors.grey),
      //         textDirection: TextDirection.rtl,
      //       ),
      //       const SizedBox(height: 16),
      //       Text(
      //         newsItem['article'] ?? 'خبر کی مکمل تفصیل یہاں ظاہر ہوگی۔',
      //         style: const TextStyle(fontSize: 18, height: 1.6),
      //         textDirection: TextDirection.rtl,
      //       ),
      //       const SizedBox(height: 24),
      //       ElevatedButton.icon(
      //         onPressed: () {
      //           // Summary button action here (to be implemented)
      //         },
      //         icon: const Icon(Icons.summarize),
      //         label: const Text("خلاصہ دیکھیں"),
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: AppColors.primary,
      //           foregroundColor: Colors.white,
      //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
