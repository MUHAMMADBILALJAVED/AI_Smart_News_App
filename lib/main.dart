// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:ai_smart_news_app/screens/explore_screen.dart';
// import 'package:ai_smart_news_app/screens/settings_screen.dart';
// import 'screens/home_screen.dart';
// import 'core/theme/app_theme.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AI Smart Press App',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.light,
//       darkTheme: AppTheme.dark,
//       themeMode: ThemeMode.system,
//       home: Home(),
//     );
//   }
// }

// // HOME 

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int PageIndex = 1;

//   final List<Widget> _tabList = [
//     const ExploreScreen(),
//     const HomeScreen(),
//     const SettingsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: Stack(
//         children: [
//           _tabList.elementAt(PageIndex),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Horizontal and vertical spacing
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 11, 49, 12), // Navigation bar background color
//                 borderRadius: BorderRadius.circular(50), // Rounded border
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2), // Shadow color
//                     blurRadius: 8, // Shadow blur
//                     offset: const Offset(0, 4), // Shadow offset
//                   ),
//                 ],
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   child: GNav(
//                     color: Colors.white,
//                     activeColor: Colors.white,
//                     tabBackgroundColor: Colors.green,
//                     tabShadow: [
//                       BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
//                     ], // Tab button shadow
//                     gap: 8,
//                     iconSize: 20,
//                     padding: const EdgeInsets.all(12),
//                     selectedIndex: PageIndex,
//                     onTabChange: (index) {
//                       setState(() {
//                         PageIndex = index;
//                       });
//                     },
//                     tabs: const [
//                       GButton(icon: Icons.search, text: 'Explore'),
//                       GButton(icon: Icons.home, text: 'Home'),
//                       GButton(icon: Icons.settings, text: 'Settings'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:ai_smart_news_app/widgets/add_to_fav.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Smart Press',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: null,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RootNavigator(),
        // '/favorites': (c) => const AddToFavScreen(),
        '/settings': (c) => const SettingsScreen(),
      },
    );
  }
}

class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});
  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  int _index = 0;
  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => setState(() => _index = 1),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                icon: const Icon(Icons.home),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Home"),
                ),
                onPressed: () => setState(() => _index = 0),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => setState(() => _index = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
