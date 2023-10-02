import 'package:agent_registration/presentation/admin/authentication/login.dart';
import 'package:agent_registration/presentation/admin/dashboard_screen.dart';
import 'package:agent_registration/presentation/agent/Register/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  Future<String> storedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');

    // bool userToken = token.toString().contains('connect.sid');
    bool adminToken = token.toString().contains('access_token');

    if (token == null) {
      return 'notLoggedIn';
    } else {
      if (adminToken) {
        return 'admin';
      } else {
        return 'user';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: storedPrefrence(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the result

          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle any errors that occurred during the future computation
          return Text('Error: ${snapshot.error}');
        } else {
          print(snapshot.requireData);
          // Use the snapshot data to conditionally return a Container or Scaffold
          return snapshot.data == 'notLoggedIn'
              ? const Register()
              : snapshot.data == 'user'
                  ? Scaffold(
                      body: Login(),
                    )
                  : const Scaffold(
                      body: DashboardScreen(),
                    );
        }
      },
    );
  }
}
