import 'package:flutter/material.dart';
import 'package:ktv_mvp/data/mock_data.dart';
import 'screens/home_screen.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(const KtvMvpApp());
}

class KtvMvpApp extends StatelessWidget {
  const KtvMvpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KTV MVP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF18392B),  // --deep
        scaffoldBackgroundColor: Colors.white,  // --white
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF85AA9B),  // --mint-2
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD0DED8),  // --mint-1
            side: const BorderSide(color: Color(0xFF85AA9B), width: 2),  // --mint-2
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/admin': (context) => const AdminDashboard(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/reserve') {
          // TODO: Handle quick reserve with room argument
          return MaterialPageRoute(builder: (context) => const Placeholder());  // Placeholder for QuickReserveScreen
        }
        return null;
      },
    );
  }
}

// Global color constants for easy access
const Color kWhite = Color(0xFFFFFFFF);
const Color kMint1 = Color(0xFFD0DED8);
const Color kMint2 = Color(0xFF85AA9B);
const Color kMint3 = Color(0xFF588B76);
const Color kDeep = Color(0xFF18392B);
