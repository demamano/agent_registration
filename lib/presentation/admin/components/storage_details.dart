import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';
import '../constants/constants.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  StorageDetails({
    Key? key,
  }) : super(key: key);

  final List city = ['Addis Ababa', 'Adama', 'Debre Berhan', 'Wolyita Sodo'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserBloc, FetchUserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Customer Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                //  Chart(),
                StorageInfoCard(
                  svgSrc: "assets/icons/Documents.svg",
                  title: "Gender",
                  amountOfFiles: state.users
                      .where((element) => element.gender == 'male')
                      .length
                      .toString(),
                  numOfFiles: state.users.length,
                ),
                StorageInfoCard(
                  svgSrc: "assets/icons/media.svg",
                  title: "state",
                  amountOfFiles: state.users.length.toString(),
                  numOfFiles: state.users.length,
                ),
                StorageInfoCard(
                  svgSrc: "assets/icons/folder.svg",
                  title: "Addis Ababa",
                  amountOfFiles: state.users
                      .where((element) => element.city == city[0])
                      .length
                      .toString(),
                  numOfFiles: state.users.length,
                ),
                StorageInfoCard(
                  svgSrc: "assets/icons/folder.svg",
                  title: "Debre Berhan",
                  amountOfFiles: state.users
                      .where((element) => element.city == city[1])
                      .length
                      .toString(),
                  numOfFiles: state.users.length,
                ),
                StorageInfoCard(
                  svgSrc: "assets/icons/folder.svg",
                  title: "Adama",
                  amountOfFiles: state.users
                      .where((element) => element.city == city[2])
                      .length
                      .toString(),
                  numOfFiles: state.users.length,
                ),
                StorageInfoCard(
                  svgSrc: "assets/icons/unknown.svg",
                  title: "individual",
                  amountOfFiles: state.users
                      .where((element) => element.agentType == 'simple')
                      .length
                      .toString(),
                  numOfFiles: state.users.length,
                ),
              ],
            ),
          );
        } else {
          return const Text("Loading...");
        }
      },
    );
  }
}
