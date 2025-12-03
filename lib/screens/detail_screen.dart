// lib/screens/detail_screen.dart

// changes Start here
// import 'package:ai_smart_news_app/services/summarizer_api.dart';
// import 'package:flutter/material.dart';
// import '../core/constants/colors.dart';

// class DetailScreen extends StatelessWidget {
//   final Map<String, dynamic> newsItem;

//   const DetailScreen({super.key, required this.newsItem});
  
//   bool? get isloading => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(newsItem['source'] ?? 'News Channel'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.picture_as_pdf), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.share), onPressed: () {}),
//         ],
//       ),

//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   newsItem['title'] ?? 'خبر کا عنوان',
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 const SizedBox(height: 12),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     newsItem['image_url'] ?? '',
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder:
//                         (context, error, stackTrace) => Container(
//                           height: 200,
//                           color: Colors.grey.shade300,
//                           child: const Icon(Icons.broken_image),
//                         ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   newsItem['published_date'] ?? '',
//                   style: const TextStyle(color: Colors.grey),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   newsItem['article'] ?? 'خبر کی مکمل تفصیل یہاں ظاہر ہوگی۔',
//                   style: const TextStyle(fontSize: 18, height: 1.6),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 const SizedBox(height: 24),
// changes End here

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

// Changes Start Here                
          //     ],
          //   ),
          // ),
          // Positioned(
          //   bottom: 20,
          //   right: 16,
          //   child: Column(
          //     children: [
          //       const SizedBox(width: 12),
          //       FloatingActionButton(
          //         heroTag: 'audioBtn',
          //         onPressed: () {},
          //         backgroundColor: AppColors.primary,
          //         foregroundColor: Colors.white,
          //         child: Icon(Icons.volume_up),
          //       ),
          //       const SizedBox(height: 12),
          //       FloatingActionButton(
          //         heroTag: 'summaryBtn',
          //         child: CircularProgressIndicator(color: Colors.white,),
          //         backgroundColor: AppColors.primary,
          //         onPressed: () async {
          //           showDialog(
          //           context: context,
          //           barrierColor: Colors.black.withOpacity(0.4),
          //           builder: (context) {
          //             return AlertDialog(
          //               backgroundColor: Colors.white,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(16),
          //               ),
          //               title: const Text(
          //                 "خلاصہ",
          //                 style: TextStyle(fontWeight: FontWeight.bold),
          //               ),
          //               content: Text(newsItem['summary'] ?? 'خلاصہ دستیاب نہیں'),
          //               actions: [
          //                 TextButton(
          //                   child: const Text("بند کریں"),
          //                   onPressed: () => Navigator.pop(context),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       }
// Changes End Here                
                  // onPressed: () {
                  //   ArticlePage(articleText: '',);
                  //   showDialog(
                  //     context: context,
                  //     barrierColor: Colors.black.withOpacity(0.4),
                  //     builder: (context) {
                  //       return AlertDialog( 
                  //         backgroundColor: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16),
                  //         ),
                  //         title: const Text(
                  //           "خلاصہ",
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //         content: Text(result),
                  //         actions: [
                  //           TextButton(
                  //             child: const Text("بند کریں"),
                  //             onPressed: () => Navigator.pop(context),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }
                    //showDialog(
                    //context: context,
                    //barrierColor: Colors.black.withOpacity(0.3),
                    //builder: (context) {
                    //return AlertDialog(
                    //backgroundColor: Colors.white.withOpacity(0.95),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    //content: Column(
                    //mainAxisSize: MainAxisSize.min,
                    //children: [
                    //const Text("خلاصہ", style: TextStyle(fontWeight: FontWeight.bold)),
                    //const SizedBox(height: 8),
                    //const Text("['summary'] ?? 'خلاصہ دستیاب نہیں')"),
                    //const SizedBox(height: 12),
                    //ElevatedButton.icon(
                    //onPressed: () => Navigator.pop(context),
                    //icon: const Icon(Icons.close),
                    //label: const Text("بند کریں"),
                    //),
                    //],
                    //),
                    //);
                    //},
                    //);
// Changes Start Here                    
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
// Changes End Here

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
// Changes Start Here      
//     );
//   }
// }

// class ArticlePage extends StatefulWidget {
//   final String articleText;
//   const ArticlePage({super.key, required this.articleText});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ArticlePageState createState() => _ArticlePageState();
// }

// class _ArticlePageState extends State<ArticlePage> {
//   bool loading = false;
//   String summary = "";

//   void getSummary() async {
//     setState(() {
//       loading = true;
//     });

//     final api = SummarizerAPI();
//     final result = await api.generateSummary(widget.articleText);

//     setState(() {
//       summary = result;
//       loading = false;
//     });

//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: Text("Summary"),
//             content: Text(summary),
//             actions: [
//               TextButton(
//                 child: Text("OK"),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ],
//           ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Article")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(widget.articleText, style: TextStyle(fontSize: 16)),
//               ),
//             ),
//             SizedBox(height: 20),
//             loading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                   onPressed: getSummary,
//                   child: Text("Generate Summary"),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Changes End Here

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