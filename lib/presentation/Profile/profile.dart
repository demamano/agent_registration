import 'dart:io';
import 'package:agent_registration/core/button.dart';
import 'package:agent_registration/core/constant.dart';
import 'package:agent_registration/presentation/Profile/bloc/profile_bloc.dart';
import 'package:agent_registration/presentation/Profile/bloc/profile_event.dart';
import 'package:agent_registration/presentation/admin/authentication/bloc/auth_bloc.dart';
import 'package:agent_registration/presentation/admin/authentication/bloc/auth_state.dart';
import 'package:agent_registration/presentation/admin/bloc/search_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../admin/authentication/login.dart';
import 'bloc/profile_state.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, String> nonFileData = {};
  final Map<String, dynamic> files = {};

  File? id;
  File? tradePermission;
  Future<void> pickFileId() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      id = File(result.files.single.path!);
      files['id'] = id;
    }
  }

  Future<void> pickFiletradePermission() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      tradePermission = File(result.files.single.path!);
      files['tradePermission'] = tradePermission;
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("loading")));
        } else if (state is ProfileUpdate) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("User updated")));
        } else if (state is ProfileLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("ProfileLoaded")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error something else')));
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthenticatedState) {
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
                      Icons.settings,
                      color: Colors.green,
                    ),
                    onPressed: () {},
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
                      buildTextField('First Name', user['firstName'], (value) {
                        nonFileData['firstName'] = value;
                      }),
                      buildTextField("Last Name", user['lastName'], (value) {
                        nonFileData['lastName'] = value;
                      }),
                      buildTextField("Middle Name", user['middleName'],
                          (value) {
                        nonFileData['middleName'] = value;
                      }),
                      CustomButton(
                          // padding: EdgeInsets.symmetric(vertical: 10),
                          buttonText: 'Upload',
                          onTap: pickFileId),
                      CustomButton(
                          // padding: EdgeInsets.symmetric(vertical: 10),
                          buttonText: 'Upload',
                          onTap: pickFiletradePermission),
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
                            onPressed: () {
                              profileBloc.add(UpdateUser(
                                  nonFileData: nonFileData,
                                  files: files,
                                  id: user["id"]));
                            },
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
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
                child: Scaffold(
                    body: Center(child: Text("user profile unable to load"))));
          }
        },
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, Function(String value)? func) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        onChanged: (value) => func!(value),
      ),
    );
  }
}
