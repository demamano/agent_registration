import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/textfield.dart';
import '../../Profile/admin_profile.dart';
import '../../Profile/bloc/bloc.dart';
import '../authentication/bloc/bloc.dart';
import '../authentication/login.dart';
import '../bloc/bloc.dart';
import '../constants/constants.dart';
import '../constants/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final authBloc = context.read<AuthenticationBloc>();

    return Column(children: [
      Row(
        children: [
          Expanded(
              child: TextFormInputField(
            hint: "Search",
            func: (String value) {
              context.read<FetchUserBloc>().add(SearchStarted(value));
            },
          )),
          Container(
            margin: const EdgeInsets.only(left: defaultPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                if (Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: TextButton(onPressed: () {
                      profileBloc.add(GetAdmin());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: profileBloc,
                            child: const AdminProfile(),
                          ),
                        ),
                      );
                    }, child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        // return Text(state.);
                        if (state is ProfileLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is ProfileLoadedState) {
                          Map<String, dynamic> user = state.user;
                          return Text(user['username']);
                        } else if (state is ProfileErrorState) {
                          return Text(state.error);
                        } else {
                          return const Text("Admin");
                        }
                      },
                    )),
                  ),
              ],
            ),
          )
        ],
      ),
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
    ]);
  }
}
