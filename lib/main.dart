import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/quotes_cubit.dart';
import 'package:quotes_app/screens/intro_screen.dart';
import 'package:quotes_app/screens/login_page.dart';
import 'package:quotes_app/screens/quotes_page.dart';
import 'package:quotes_app/screens/register_page.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroPage.id: (context) => const IntroPage(), // إضافة IntroPage
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        QuotesPage.id: (context) => BlocProvider(
              create: (context) => QuotesCubit(),
              child: const QuotesPage(),
            ),
      },
      initialRoute: IntroPage.id, // تأكيد أن IntroPage هو المسار الأول
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAppCheck.instance.activate(
    // androidProvider: AndroidProvider.playIntegrity, // this for production mode
    androidProvider: AndroidProvider.debug, // this for development mode
    // await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true)
  );
  runApp(const QuotesApp());
}
