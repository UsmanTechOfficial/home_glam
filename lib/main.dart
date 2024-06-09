import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_glam/app/core/services/dependency_injection.dart';
import 'package:home_glam/theme/theme.dart';
import 'package:home_glam/utils/logger.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeServices();
  runApp(const MyApp());
}

Future<void> _initializeServices() async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    //Logger.d("Firebase Initialized");

    await GetStorage.init();
    //Logger.d("GetStorage Initialized");
  } catch (e) {
    Logger.e("Error initializing services: $e");
  }
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
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Logger.i('App is resumed');
        break;
      case AppLifecycleState.paused:
        Logger.i('App is paused');
        break;
      default:
        break;
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
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBindings(),
      smartManagement: SmartManagement.keepFactory,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
