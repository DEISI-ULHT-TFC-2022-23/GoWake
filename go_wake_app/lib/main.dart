import 'package:flutter/material.dart';
import 'package:go_wake_app/configuration/configuration_controller.dart';
import 'package:go_wake_app/configuration/configuration_page.dart';
import 'package:go_wake_app/navigation_drawer_controller.dart';
import 'package:go_wake_app/services/service_locator.dart';
import 'package:go_wake_app/shared/themes/themes.dart';
import 'package:go_wake_app/utils/app_routes.dart';
import 'package:go_wake_app/views/competition_details/competition_detail_controller.dart';
import 'package:go_wake_app/views/competition_details/competition_detail_page.dart';
import 'package:go_wake_app/views/competitions/competitions_calendar_controller.dart';
import 'package:go_wake_app/views/competitions/competitions_calendar_page.dart';
import 'package:go_wake_app/views/judge/judge_controller.dart';
import 'package:go_wake_app/views/login/login_controller.dart';
import 'package:go_wake_app/views/login/login_screen.dart';
import 'package:go_wake_app/views/register/register_controller.dart';
import 'package:go_wake_app/views/register/register_page.dart';
import 'package:provider/provider.dart';
import 'custom_header_controller.dart';

import 'navigation_drawer.dart';
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
          ChangeNotifierProvider(
            create: (_) => RegisterController(),
          ),
          ChangeNotifierProvider(
            create: (_) => HeaderController(),
          ),
          ChangeNotifierProvider(
            create: (_) => CompetitionCalendarController(),
          ),
          ChangeNotifierProvider(
            create: (_) => CompetitionDetailController(),
          ),
          ChangeNotifierProvider(
            create: (_) => JudgeController(),
          ),
          ChangeNotifierProvider(
            create: (_) => NavigationDrawerController(),
          )
        ],
        child: Consumer<ConfigurationController>(
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
              AppRoutes.REGISTER: (ctx) => const RegisterPage(),
              AppRoutes.HOME: (ctx) => const CustomNavigationDrawer(),
              AppRoutes.SETTINGS: (ctx) => const ConfigurationPage(),
              AppRoutes.COMPETITIONS: (ctx) => const CompetitionsCalendarPage(),

            },
          );}
           ));
  }
}
