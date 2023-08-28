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
  final Map<String, String> formData = {};
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
      builder: (context, state) {
        if (state is LoadingRegistrationState) {
          return Scaffold();
        } else if (state is ErrorRegistrationState) {
          return const Text("ERROR");
        } else {
          return Scaffold(
            backgroundColor: Constants.color2,
            body: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.12,
                  child: Center(
                      child: Text(
                    "Agent Registration",
                    style: Constants.style1,
                  )),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: size.height * 0.06, right: size.height * 0.06),
                      child: Column(
                        children: [
                          TextFormInputField(
                            hint: 'First Name',
                            filled: true,
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(StateEvent(value));
                              formData['state'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'City',
                            filled: true,
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
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
                            painted: Constants.cOlor1,
                            func: (value) {
                              context.read<RegistrationBloc>().add(
                                    UserIdEvent(value),
                                  );
                              formData['userId'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          TextFormInputField(
                            hint: 'agent Type',
                            filled: true,
                            painted: Constants.cOlor1,
                            func: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(AgentTypeEvent(value));
                              formData['agentType'] = value;
                            },
                          ),
                          Constants.spaceBetween,
                          ButtonWidget(
                            text: 'Select ID File',
                            icon: Icons.attach_file,
                            onClicked: pickIdFile,
                          ),
                          Constants.spaceBetween,
                          ButtonWidget(
                            text: 'TradePermission',
                            icon: Icons.attach_file,
                            onClicked: pickTradePermission,
                          ),
                          Constants.spaceBetween,
                          ElevatedButton(
                            onPressed: () {
                              registrationBloc.add(RegisterUser(
                                // nonFileData: jsonDecode(formData),
                                nonFileData: formData,
                                tradePermission!,
                                id: id!,
                              ));
                              print(formData);
                            },
                            child: const Text("submit"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: const Text(
                              "login",
                              style: TextStyle(color: Constants.cOlor1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

















// class Register extends StatelessWidget {
//   Register({super.key});

//   File? id;

//   File? tradePermission;
//   final Map<String, String> formData = {};
//   Future<void> pickIdFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       id = File(result.files.single.path!);
//     }
//   }

//   Future<void> pickTradePermission() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       tradePermission = File(result.files.single.path!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final registrationBloc = BlocProvider.of<RegistrationBloc>(context);

//     final size = MediaQuery.of(context).size;
//     return BlocBuilder<RegistrationBloc, RegistrationState>(
//       // listener: (context, state) {
//       //   if (state is ErrorRegistrationState) {
//       //     Scaffold(body: Center(child: Text('Error')));
//       //   }
//       // },
//       builder: (context, state) {
//         if (state is LoadingRegistrationState) {
//           return const Scaffold(body: CircularProgressIndicator());
//         } else if (state is SuccessRegistrationState) {
//           return Text('Form submitted successfully');
//         } else if (state is ErrorRegistrationState) {
//           return Text('Error:${state.errorMessage}');
//         } else {
//           return Scaffold(
//             // appBar: AppBar(),
//             body: SizedBox(
//               width: size.width,
//               height: size.height,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 8, top: 0.0),
//                       width: double.infinity,
//                       height: size.height * 0.12,
//                       color: Constants.cOlor1,
//                       child: Center(child: Text("Agent Registration")),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(
//                           left: size.height * 0.03,
//                           right: size.height * 0.03,
//                           bottom: 0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           TextFormInputField(
//                             hint: 'First Name',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(FirstNameEvent(value));
//                               formData['firstName'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'Middle Name',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(MiddleNameEvent(value));
//                               formData['middleName'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'Last Name',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(LastNameEvent(value));
//                               formData['lastName'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'Gender',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(GenderEvent(value));
//                               formData['gender'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'username',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(UserNameEvent(value));
//                               formData['username'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'Phone Number',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(PhoneNumberEvent(value));
//                               formData['phone'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'country',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(CountryEvent(value));
//                               formData['country'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'State',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(StateEvent(value));
//                               formData['state'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'City',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(CityEvent(value));
//                               formData['city'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'property size',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(PropertySizeEvent(value));
//                               formData['propertySize'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'password',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(PasswordEvent(value));
//                               formData['password'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           TextFormInputField(
//                             hint: 'userId',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context.read<RegistrationBloc>().add(
//                                     UserIdEvent(value),
//                                   );
//                               formData['userId'] = value;
//                             },
//                           ),
//                           TextFormInputField(
//                             hint: 'agent Type',
//                             filled: true,
//                             painted: Constants.cOlor1,
//                             func: (value) {
//                               context
//                                   .read<RegistrationBloc>()
//                                   .add(AgentTypeEvent(value));
//                               formData['agentType'] = value;
//                             },
//                           ),
//                           Constants.spaceBetween,
//                           Container(
//                             color: Constants.color2,
//                             child: ButtonWidget(
//                               text: 'Select ID File',
//                               icon: Icons.attach_file,
//                               onClicked: pickIdFile,
//                             ),
//                           ),
//                           Constants.spaceBetween,
//                           Container(
//                             color: Constants.color2,
//                             child: ButtonWidget(
//                               text: 'Select TradePermission',
//                               icon: Icons.attach_file,
//                               onClicked: pickTradePermission,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Constants.spaceBetween,
//                     SizedBox(
//                       // height: size.height * 0.002,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           registrationBloc.add(RegisterUser(
//                             // nonFileData: jsonDecode(formData),
//                             nonFileData: formData,
//                             tradePermission!,
//                             id: id!,
//                           ));
//                           print(formData);
//                         },
//                         child: const Text("submit"),
//                       ),
//                     ),
//                     Container(
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Login()));
//                         },
//                         child: const Text(
//                           "login",
//                           style: TextStyle(color: Constants.cOlor1),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
