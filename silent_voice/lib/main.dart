import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silent_voice/login.dart';
import 'package:silent_voice/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runApp(const SilentVoiceApp());
}

class SilentVoiceApp extends StatefulWidget {
  const SilentVoiceApp({super.key});

  @override
  State<SilentVoiceApp> createState() => _SilentVoiceAppState();
}

class _SilentVoiceAppState extends State<SilentVoiceApp> {
  bool showSplash = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Supabase.initialize(
    url: 'https://xxfbilctljijrknmhpml.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh4ZmJpbGN0bGppanJrbm1ocG1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIyMzcwNzgsImV4cCI6MjA1NzgxMzA3OH0.QDaChVzNbSos260GXkpn2Q9DqqPXEftO0LkR0tRfXb4',
  );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 3)); // Splash screen delay

    if (mounted) {
      setState(() {
        isLoggedIn = loggedIn;
        showSplash = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return MaterialApp(
          locale: languageProvider.currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('hi', ''),
            Locale('ta', ''),
            Locale('gu', ''),
          ],
          home: Login(setLocale: (locale ) {  },),
        );
      },
    );
  }
}
