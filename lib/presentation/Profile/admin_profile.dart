import 'package:agent_registration/core/button.dart';
import 'package:agent_registration/core/constant.dart';
import 'package:agent_registration/presentation/Profile/bloc/profile_bloc.dart';
import 'package:agent_registration/presentation/Profile/bloc/profile_state.dart';
import 'package:agent_registration/presentation/admin/authentication/bloc/auth_bloc.dart';
import 'package:agent_registration/presentation/admin/authentication/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../admin/authentication/login.dart';
import 'bloc/profile_event.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});
  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final authBloc = context.read<AuthenticationBloc>();
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (state is ProfileLoadedState) {
              Map<String, dynamic> user = state.user;

              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 1,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        authBloc.add(Refresh());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: authBloc,
                              child: Login(),
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                  ],
                  flexibleSpace: Container(
                    decoration:
                        const BoxDecoration(gradient: Constants.colorGradient),
                  ),
                  centerTitle: true,
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: Container(
                  padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        buildTextField('First Name', user['username'], false),
                        buildTextField("Username", user['username'], false),
                        buildTextField("Password", "********", true),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "CANCEL",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            authBloc.add(Logout());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: authBloc,
                                  child: Login(),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CustomButton(
                      buttonText: 'retry',
                      onTap: () {
                        profileBloc.add(GetAdmin());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: profileBloc,
                                child: const AdminProfile(),
                              ),
                            ));
                      }),
                ),
              );
            }
          }
        },
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
