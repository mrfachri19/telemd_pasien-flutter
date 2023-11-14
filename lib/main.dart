import 'dart:io';
import 'package:telemedicine_pasien/bloc_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:telemedicine_pasien/pages/main_page/main_page.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';
// import 'pages/pages.dart';
// import 'widgets/costom_navbar.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: const GetMaterialApp(
        onGenerateRoute: AppPages.generateRoute,
        initialRoute: AppPages.initial,
        home: MainPage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
