import 'package:agent_registration/presentation/admin/authentication/bloc/auth_bloc.dart';
import 'package:agent_registration/presentation/admin/authentication/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/textfield.dart';
import 'bloc/auth_state.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AdminAuthenticatedState) {
          Navigator.of(context).pushNamed('/dashboard');
        } else if (state is AuthenticatedState) {
          Navigator.of(context).pushNamed('/profile');
        }
      },
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is ErrorAuthenticationState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is LoadingAuthenticationState) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Material(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background-image.jfif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormInputField(
                        hint: 'username',
                        func: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(UserNameEvent(value));
                          username = value;
                        },
                      ),
                      TextFormInputField(
                        hint: 'password',
                        func: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(PasswordEvent(value));
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            authenticationBloc
                                .add(LoginUser(username, password));
                          },
                          child: const Text('Login')),
                      TextButton.icon(
                          onPressed: () {
                            authenticationBloc
                                .add(LoginAdminUser(username, password));
                          },
                          icon: const Icon(Icons.admin_panel_settings),
                          label: const Text('admin'))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
