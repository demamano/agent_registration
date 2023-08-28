// contains core functionality and utilities that are shared across the project
// constants contains such as api urls
import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = "192.168.56.1:3000";

  AppBar buildAppBar(function) {
    return AppBar(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.green,
        ),
        onPressed: function,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
      ],

      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: Constants.colorGradient),
      ),

      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  static const spaceBetween = SizedBox(
    height: 10,
  );
  static const style1 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const style2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const style3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const cOlor1 = Color.fromARGB(255, 2, 16, 61);
  // static const cOlor1 = Colors.yellow;
  // shop color #bc982b
  // category #dd9933
  // static const cOlor1 = Color(0xffbc982b);
  static const color2 = Color.fromARGB(146, 11, 114, 162);
  static const hintstyling = Color.fromARGB(255, 206, 205, 205);
  static const colorGradient = LinearGradient(colors: [
    Color.fromARGB(255, 32, 37, 97),
    Color.fromARGB(255, 2, 16, 61)
  ]);
}
