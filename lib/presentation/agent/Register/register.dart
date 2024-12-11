import 'dart:io';
import 'package:agent_registration/core/button.dart';
import 'package:agent_registration/core/widgets/textfield.dart';
import 'package:agent_registration/presentation/agent/Register/bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/constant.dart';

import '../../admin/authentication/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isAgreed = false;
  File? id;
  File? tradePermission;
  Future<void> pickFileId() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      id = File(result.files.single.path!);
    }
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );

  Future<void> pickFiletradePermission() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      tradePermission = File(result.files.single.path!);
    }
  }

  final Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is LoadingRegistrationState) {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        } else if (state is ErrorRegistrationState) {
          return Scaffold(
            body: Center(child: Text(state.errorMessage.toString())),
          );
        } else {
          return Scaffold(
            body: Material(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background-image.jfif"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: size.width,
                height: size.height,
                child: PageView(
                  controller: _controller,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormInputField(
                          hint: 'First Name',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(FirstNameEvent(value));
                            formData['firstName'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'Middle Name',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(MiddleNameEvent(value));
                            formData['middleName'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'Last Name',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(LastNameEvent(value));
                            formData['lastName'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'Gender',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(GenderEvent(value));
                            formData['gender'] = value;
                          },
                        ),
                        CustomButton(
                            buttonText: 'Next',
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormInputField(
                          hint: 'username',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(UserNameEvent(value));
                            formData['username'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'password',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(PasswordEvent(value));
                            formData['password'] = value;
                          },
                        ),
                        CustomButton(
                            buttonText: 'Next',
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: size.height * 0.09,
                            right: size.height * 0.09,
                            top: size.height * 0.009,
                          ),
                          child: IntlPhoneField(
                            decoration: Constants().decorate('Phone Number'),
                            initialCountryCode: 'ET',
                            onChanged: (phone) {
                              formData['phone'] = phone.completeNumber;
                            },
                          ),
                        ),
                        TextFormInputField(
                          hint: 'country',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(CountryEvent(value));
                            formData['country'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'State',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(StateEvent(value));
                            formData['state'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'City',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(CityEvent(value));
                            formData['city'] = value;
                          },
                        ),
                        CustomButton(
                            buttonText: 'Next',
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormInputField(
                          hint: 'agent Type',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(AgentTypeEvent(value));
                            formData['agentType'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'property size',
                          func: (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(PropertySizeEvent(value));
                            formData['propertySize'] = value;
                          },
                        ),
                        TextFormInputField(
                          hint: 'userId',
                          func: (value) {
                            context.read<RegistrationBloc>().add(
                                  UserIdEvent(value),
                                );
                            formData['userId'] = value;
                          },
                        ),
                        CustomButton(
                            buttonText: 'Next',
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                            buttonText: 'Select ID File', onTap: pickFileId),
                        CustomButton(
                          buttonText: 'TradePermission',
                          onTap: pickFiletradePermission,
                        ),
                        CustomButton(
                            buttonText: 'Next',
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                            'By checking this box, you are agreeing to our terms of service.'),
                        Checkbox(
                          value: _isAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              _isAgreed = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _isAgreed
                              ? () {
                                  registrationBloc.add(RegisterUser(
                                    nonFileData: formData,
                                    tradePermission,
                                    id: id!,
                                  ));
                                }
                              : null,
                          child: const Text('Register'),
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
