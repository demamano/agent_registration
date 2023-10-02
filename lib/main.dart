import 'dart:io';

import 'package:agent_registration/bloc_provider.dart';
import 'package:agent_registration/presentation/Profile/profile.dart';
import 'package:agent_registration/presentation/Profile/setting.dart';
import 'package:agent_registration/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/admin/authentication/login.dart';
import 'presentation/agent/Register/register.dart';

import 'presentation/admin/dashboard_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: bgColor,
        //   // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //   //     .apply(bodyColor: Colors.white),
        //   canvasColor: secondaryColor,
        // ),

        home: const WelcomeScreen(),
        // home: Register(),
        // home: Register(),
        // home:AdminLogin(),

        initialRoute: '/',
        routes: {
          "/home": (context) => const Profile(),
          "/admin-login": (context) => Login(),
          "/dashboard": (context) => const DashboardScreen(),
          "/register": (context) => const Register(),
          "/profile": (context) => const Profile(),
          '/setting': (context) => const SettingsPage()
          // "/profile_admin": (context) => const AdminProfile(),
        },
      ),
    );
  }
}
