import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ai_smart_news_app/screens/explore_screen.dart';
import 'package:ai_smart_news_app/screens/settings_screen.dart';
import 'screens/home_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Smart Press App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}

// HOME 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int PageIndex = 1;

  final List<Widget> _tabList = [
    const ExploreScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          _tabList.elementAt(PageIndex),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Horizontal and vertical spacing
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 49, 12), // Navigation bar background color
                borderRadius: BorderRadius.circular(50), // Rounded border
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 8, // Shadow blur
                    offset: const Offset(0, 4), // Shadow offset
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: GNav(
                    color: Colors.white,
                    activeColor: Colors.white,
                    tabBackgroundColor: Colors.green,
                    tabShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                    ], // Tab button shadow
                    gap: 8,
                    iconSize: 20,
                    padding: const EdgeInsets.all(12),
                    selectedIndex: PageIndex,
                    onTabChange: (index) {
                      setState(() {
                        PageIndex = index;
                      });
                    },
                    tabs: const [
                      GButton(icon: Icons.search, text: 'Explore'),
                      GButton(icon: Icons.home, text: 'Home'),
                      GButton(icon: Icons.settings, text: 'Settings'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
