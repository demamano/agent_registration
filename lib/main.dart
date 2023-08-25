import 'dart:io';

import 'package:agent_registration/data/Repository/auth_repository.dart';
import 'package:agent_registration/presentation/Register/bloc/bloc.dart';
import 'package:agent_registration/presentation/auth/register.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final registerBloc = RegistrationBloc();
  final RegistrationBloc registrationBloc = RegistrationBloc(
      RegistrationRepository(
          Dio(BaseOptions(baseUrl: 'https://192.168.56.1:3000', contentType: "multipart/form-data; boundary=<calculated when request is sent>",validateStatus: (status) => false,))));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          brightness: Brightness.light),
      home: BlocProvider<RegistrationBloc>(
        create: (context) => registrationBloc,
        child: Register(),
      )
      
      
    );
  }
}
