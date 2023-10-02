import 'package:agent_registration/presentation/Profile/bloc/profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/model/user.dart';
import '../../Profile/admin_profile.dart';
import '../../Profile/bloc/profile_bloc.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';
import '../constants/constants.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    return BlocListener<FetchUserBloc, FetchUserState>(
      listener: (context, state) {
        if (state is UserLoadErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
      },
      child: BlocBuilder<FetchUserBloc, FetchUserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            List<User> userlist = state.users;
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DataTable(
                          columnSpacing: defaultPadding,
                          columns: const [
                            DataColumn(
                              label: Text("First Name"),
                            ),
                            DataColumn(
                              label: Text("Last Name"),
                            ),
                            DataColumn(
                              label: Text("Gender"),
                            ),
                            DataColumn(
                              label: Text("Agent Type"),
                            ),
                            DataColumn(
                              label: Text("Country"),
                            ),
                            DataColumn(
                              label: Text("state"),
                            ),
                            DataColumn(
                              label: Text("City"),
                            ),
                            DataColumn(
                              label: Text("Property size"),
                            ),
                            DataColumn(
                              label: Text("Phone"),
                            ),
                            DataColumn(
                              label: Text("IdFile"),
                            ),
                            DataColumn(
                              label: Text("Trade Permission File"),
                            ),
                            DataColumn(
                              label: Text("Middle Name"),
                            ),
                          ],
                          rows: List.generate(
                            userlist.length,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    GestureDetector(
                                      onTap: () {
                                        profileBloc.add(
                                            GetUserById(userlist[index].id));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider.value(
                                              value: profileBloc,
                                              child: const AdminProfile(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: defaultPadding),
                                            child:
                                                Text(userlist[index].firstName),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(userlist[index].lastName)),
                                  DataCell(Text(userlist[index].middleName)),
                                  DataCell(Text(userlist[index].gender)),
                                  DataCell(Text(userlist[index].agentType)),
                                  DataCell(Text(userlist[index].country)),
                                  DataCell(Text(userlist[index].state)),
                                  DataCell(Text(userlist[index].city)),
                                  DataCell(Text(userlist[index].propertySize)),
                                  DataCell(Text(userlist[index].phone)),
                                  DataCell(InkWell(
                                      onTap: () => launchUrl(Uri.parse(
                                            userlist[index].idUrl,
                                          )),
                                      child: Text(
                                        userlist[index].idUrl,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue),
                                      ))),
                                  DataCell(InkWell(
                                      onTap: () => launchUrl(
                                          Uri.parse(userlist[index].tradeUrl!)),
                                      child: Text(
                                        userlist[index].tradeUrl!,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue),
                                      ))),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
