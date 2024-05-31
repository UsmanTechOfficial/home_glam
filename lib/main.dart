import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/core/services/service_injections.dart';
import 'package:home_glam/theme/theme.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('App is resumed');
    } else if (state == AppLifecycleState.paused) {
      // App is paused, handle the transition
      print('App is paused');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: AppTheme.instance.light,
      darkTheme: AppTheme.instance.dark,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.rightToLeft,
      // transitionDuration: const Duration(milliseconds: 200),
      getPages: AppPages.routes,
      initialRoute: Routes.LOGIN,
      smartManagement: SmartManagement.keepFactory,
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialBinding: AppBindings(),
      // home: const SplashView(),
    );
  }
}
