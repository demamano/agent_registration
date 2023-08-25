import 'package:agent_registration/presentation/Register/bloc/register_bloc.dart';
import 'package:agent_registration/presentation/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constant.dart';
import '../../core/widgets/textfield.dart';
import '../admin/dashboard.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height / 5.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 32, 37, 97),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height / 5.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 2, 16, 61),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                    ),
                  ),
                  child: const Text("hello"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 1.226,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 2, 16, 61),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 1.226,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 32, 37, 97),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(160, 80),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Contact Details',
                                style: Constants.style2)),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.height * 0.09,
                              right: size.height * 0.09),
                          height: size.height * 0.7,
                          child: Column(
                            children: [
                              TextFormInputField(
                                hint: 'username',
                                filled: true,
                                painted: Colors.black,
                               func: (value){
                                // context.read<RegistrationBloc>().add()
                               },
                              ),
                              
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Login'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
