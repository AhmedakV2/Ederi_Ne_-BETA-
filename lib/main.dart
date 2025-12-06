import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/price_list_screen.dart';
import 'screens/add_price_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const EderiNeApp());
}

class EderiNeApp extends StatelessWidget {
  const EderiNeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ederi Ne?',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1E88E5),
          secondary: const Color(0xFFFF9800),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E88E5),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E88E5),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/': page = const LoginScreen(); break;
          case '/home': page = const PriceListScreen(); break;
          case '/add': page = const AddPriceScreen(); break;
          case '/profile': page = const ProfileScreen(); break;
          default: page = const LoginScreen();
        }
        
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.05, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeOut;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );
      },
    );
  }
}