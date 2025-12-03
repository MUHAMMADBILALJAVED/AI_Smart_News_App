// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:ai_smart_news_app/widgets/add_to_fav.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/AI-Smart Logo.png', // Replace with your actual logo path
                  height: 60,
                ),
                const SizedBox(width: 10),
                const Text(
                  'AI-Smart Press',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildToggleRow(Icons.remove_red_eye, 'Dark Mode', darkMode, (val) {
                    setState(() => darkMode = val);
                  }),
                  _buildToggleRow(Icons.notifications, 'Notifications', notifications, (val) {
                    setState(() => notifications = val);
                  }),
                  _buildToggleRow(Icons.language, 'Switch to English', isEnglish, (val) {
                    setState(() => isEnglish = val);
                  }),
                  _buildIconRow(Icons.bookmark, 'Bookmarks', onTap: () {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(
                      //   builder: (context) => AddToFav(article: null,),
                      // ),
                    );
                  }),
                  _buildIconRow(Icons.feedback, 'Send Feedback', onTap: () {
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
                              const Text("Send Feedback!", style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              // const Text("['summary'] ?? 'خلاصہ دستیاب نہیں')"),
                              const SizedBox(height: 12),
                              ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                label: const Text(" Cancel "),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                label: const Text(" Send "),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow(IconData icon, String text, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
        Switch(value: value, onChanged: onChanged, activeColor: Colors.white)
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
