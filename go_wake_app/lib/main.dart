import 'package:flutter/material.dart';
import 'package:go_wake_app/configuration/configuration_controller.dart';
import 'package:go_wake_app/configuration/configuration_page.dart';
import 'package:go_wake_app/home/home_page.dart';
import 'package:go_wake_app/services/service_locator.dart';
import 'package:go_wake_app/shared/themes/themes.dart';
import 'package:go_wake_app/utils/app_routes.dart';
import 'package:go_wake_app/views/login/login_controller.dart';
import 'package:go_wake_app/views/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginController(),
          ),
          ChangeNotifierProvider(
            create: (_) => ConfigurationController(),
          ),
        ],
        child:   Consumer<ConfigurationController>(
           builder: (BuildContext context, controller, widget) {
          return MaterialApp(
            title: 'GoWake App',
            debugShowCheckedModeBanner: false,
            themeMode: controller.themeMode.value,
            theme: lightTheme,
            darkTheme: dartTheme,
            routes: {
              AppRoutes.SPLASH: (ctx) => const Splash(),
              AppRoutes.LOGIN: (ctx) => LoginScreen(),
              AppRoutes.HOME: (ctx) => const HomePage(),
              AppRoutes.SETTINGS: (ctx) => const ConfigurationPage(),
            },
          );}
           ));
  }
}
