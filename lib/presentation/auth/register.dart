import 'dart:convert';
import 'dart:io';
import 'package:agent_registration/core/widgets/textfield.dart';
import 'package:agent_registration/presentation/Register/bloc/bloc.dart';
import 'package:agent_registration/presentation/auth/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constant.dart';
import '../../core/widgets/button.dart';

class Register extends StatelessWidget {
  Register({super.key});

  File? id;

  File? tradePermission;
  final Map<String, dynamic> formData = {};
  Future<void> pickIdFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      id = File(result.files.single.path!);
    }
  }

  Future<void> pickTradePermission() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      tradePermission = File(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);

    final size = MediaQuery.of(context).size;
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      // listener: (context, state) {
      //   if (state is ErrorRegistrationState) {
      //     Scaffold(body: Center(child: Text('Error')));
      //   }
      // },
      builder: (context, state) {
        if (state is LoadingRegistrationState) {
          return const Scaffold(body: CircularProgressIndicator());
        } else if (state is SuccessRegistrationState) {
          return Text('Form submitted successfully');
        } else if (state is ErrorRegistrationState) {
          return Text('Error:${state.errorMessage}');
        } else {
          return Scaffold(
            // appBar: AppBar(),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8, top: 0.0),
                      width: double.infinity,
                      height: size.height * 0.12,
                      color: Constants.cOlor1,
                      child: Center(child: Text("Agent Registration")),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: size.height * 0.03,
                          right: size.height * 0.03,
                          bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormInputField(
                            hint: 'First Name',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(FirstNameEvent(value));
                              formData['firstName'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'Middle Name',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(MiddleNameEvent(value));
                              formData['middleName'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'Last Name',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(LastNameEvent(value));
                              formData['lastName'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'Gender',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(GenderEvent(value));
                              formData['gender'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'username',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(UserNameEvent(value));
                              formData['username'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'Phone Number',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(PhoneNumberEvent(value));
                              formData['phone'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'country',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(CountryEvent(value));
                              formData['country'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'State',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(StateEvent(value));
                              formData['state'];
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'City',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(CityEvent(value));
                              formData['city'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'property size',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(PropertySizeEvent(value));
                              formData['propertySize'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'password',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(PasswordEvent(value));
                              formData['password'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'userId',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context.read<RegistrationBloc>().add(
                                    UserIdEvent(value),
                                  );
                              formData['userId'] = value;
                            },
                          ),
                          TextFormInputField(
                            hint: 'agent Type',
                            filled: true,
                            painted: Colors.black,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(AgentTypeEvent(value));
                              formData['agentType'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          Container(
                            color: Constants.color2,
                            child: ButtonWidget(
                              text: 'Select ID File',
                              icon: Icons.attach_file,
                              onClicked: pickIdFile,
                            ),
                          ),
                          Constants.spaceBetween,
                          Container(
                            color: Constants.color2,
                            child: ButtonWidget(
                              text: 'Select TradePermission',
                              icon: Icons.attach_file,
                              onClicked: pickTradePermission,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Constants.spaceBetween,
                    SizedBox(
                      // height: size.height * 0.002,
                      child: ElevatedButton(
                        onPressed: () {
                          registrationBloc.add(RegisterUser(
                            nonFileData: jsonDecode(formData),
                            tradePermission!,
                            id: id!,
                          ));
                          print(formData);
                        },
                        child: const Text("submit"),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';

// import '../../core/constant.dart';
// import '../../core/widgets/textfield.dart';

// class Register extends StatelessWidget {
//   Register({super.key});
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController middleNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController agentTypeController = TextEditingController();
//   final TextEditingController propertySizeController = TextEditingController();
//   final TextEditingController userIdController = TextEditingController();
//   File? id;
//   File? tradePermission;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Material(
//       child: Container(
//         width: size.width,
//         height: size.height,
//         child: Stack(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: size.width,
//                   height: size.height / 5.4,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 32, 37, 97),
//                   ),
//                 ),
//                 Container(
//                   width: size.width,
//                   height: size.height / 5.4,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 2, 16, 61),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(120),
//                     ),
//                   ),
//                   child: const Text("hello"),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: size.height / 1.226,
//                 width: size.width,
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 2, 16, 61),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: size.height / 1.226,
//                 width: size.width,
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 32, 37, 97),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.elliptical(160, 80),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Column(
//                       children: [
//                         const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text('Contact Details',
//                                 style: Constants.style2)),
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: size.height * 0.09,
//                               right: size.height * 0.09),
//                           height: size.height * 0.7,
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 // TextFormInputField(
//                                 //   hint: 'username',
//                                 //   filled: true,
//                                 //   painted: Colors.black,
//                                 //   controller: usernameController,
//                                 // ),
//                                 TextFormInputField(
//                                   hint: 'First Name',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: firstNameController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'Middle Name',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: middleNameController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'Last Name',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: lastNameController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'Gender',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: genderController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'username',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: usernameController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'Phone Number',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: phoneController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'country',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: countryController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'State',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: stateController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'City',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: cityController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'property size',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: propertySizeController,
//                                 ),
//                                 Constants.spaceBetween,
//                                 // TextFormInputField(
//                                 //   hint: 'phone Number',
//                                 //   filled: true,
//                                 //   painted: Colors.black,
//                                 //   controller: phoneController,
//                                 // ),
//                                 Constants.spaceBetween,
//                                 TextFormInputField(
//                                   hint: 'userId',
//                                   filled: true,
//                                   painted: Colors.black,
//                                   controller: userIdController,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                             onPressed: () {}, child: const Text('Login'))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



 // final formData = {
                          //   'firstName': firstNameController.text.trim(),
                          //   'middleName': middleNameController.text,
                          //   'lastName': lastNameController.text,
                          //   'username': usernameController.text,
                          //   'password': passwordController.text,
                          //   'gender': genderController.text,
                          //   'phone': phoneController.text,
                          //   'country': countryController.text,
                          //   'city': cityController.text,
                          //   'state': stateController.text,
                          //   'agentType': agentTypeController.text,
                          //   'propertySize': propertySizeController.text,
                          //   'userId': userIdController.text,
                          // };

