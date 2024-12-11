import 'package:agent_registration/core/constant.dart';
import 'package:agent_registration/data/Repository/users_repository.dart';
import 'package:agent_registration/presentation/Profile/bloc/profile_bloc.dart';
import 'package:agent_registration/presentation/admin/bloc/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/Repository/auth_repository.dart';
import 'data/Repository/register_repository.dart';
import 'presentation/agent/Register/bloc/register_bloc.dart';
import 'presentation/admin/authentication/bloc/auth_bloc.dart';

final RegistrationBloc registrationBloc =
    RegistrationBloc(RegistrationRepository(Dio(BaseOptions(
  baseUrl: Constants.baseUrl,
  contentType:
      "multipart/form-data; boundary=<calculated when request is sent>",
  // validateStatus: (status) => false,
))));
final AuthenticationBloc authenticationBloc = AuthenticationBloc(
  AuthenticationRepository(Dio(
    BaseOptions(
      // headers: ,
      baseUrl: Constants.baseUrl,
      contentType: "application/json",
      // validateStatus: (status) => false,
    ),
  )),
);
final AuthenticationBloc authenticationAgentBloc = AuthenticationBloc(
  AuthenticationRepository(
    Dio(
      BaseOptions(
        // headers: ,
        baseUrl: Constants.baseUrl,
        contentType: "application/json",
        // validateStatus: (status) => false,
      ),
    ),
  ),
);
final FetchUserBloc fetchUserBloc = FetchUserBloc(
  UserRepository(
    Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        contentType: "application/json; charset=utf-8",
        // validateStatus: (status) => false,
      ),
    ),
  ),
);
final ProfileBloc profileBloc = ProfileBloc(UserRepository(
  Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      contentType: "application/json; charset=utf-8",
      // validateStatus: (status) => false,
    ),
  ),
));

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(
            lazy: true, create: (BuildContext context) => registrationBloc),
        BlocProvider(
            lazy: true, create: (BuildContext context) => authenticationBloc),
        BlocProvider(
            lazy: true, create: (BuildContext context) => fetchUserBloc),
        BlocProvider(
            lazy: true,
            create: (BuildContext context) => authenticationAgentBloc),
        BlocProvider(lazy: true, create: (BuildContext context) => profileBloc)
      ];
}
