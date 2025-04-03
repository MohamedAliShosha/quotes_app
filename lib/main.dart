import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/cubit/fetching_quotes_cubit/quotes_cubit.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/views/add_quotes_view.dart';
import 'package:quotes_app/views/home_view.dart';
import 'package:quotes_app/views/intro_view.dart';
import 'package:quotes_app/views/login_page.dart';
import 'package:quotes_app/views/quotes_view.dart';
import 'package:quotes_app/views/register_page.dart';
import 'package:quotes_app/simple_bloc_observer.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReadNotesCubit(), // to provide the context of ReadNotesCubit
      child: MaterialApp(
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        ], // Initialize Firebase Analytics Observer
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AddQuotesView.id: (context) =>
              const AddQuotesView(), // إضافة AddQuotesPage
          IntroView.id: (context) => const IntroView(), // إضافة IntroPage
          LoginPage.id: (context) => const LoginPage(),
          HomeView.id: (context) => const HomeView(),
          RegisterPage.id: (context) => const RegisterPage(),
          QuotesView.id: (context) => BlocProvider(
                create: (context) => QuotesCubit(),
                child: const QuotesView(),
              ),
        },
        initialRoute: IntroView.id, // تأكيد أن IntroPage هو المسار الأول
      ),
    );
  }
}

void main() async {
  await Hive.initFlutter(); // initialize Hive

  Bloc.observer = SimpleBlocObserver(); // set the observer
  Hive.registerAdapter(DataBaseQuoteModelAdapter()); // register the adapter
  await Hive.openBox<DataBaseQuoteModel>(
      kQuotesBox); // open the quotes box and identifiying the type of the box DataBaseQuoteModel
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    // androidProvider: AndroidProvider.playIntegrity, // this for production mode
    androidProvider: AndroidProvider.debug, // this for development modereff
    // await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true)
  );
  runApp(const QuotesApp());
}
