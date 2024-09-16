import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../constants/constants.dart';

class Chart extends StatelessWidget {
  Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserBloc, FetchUserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          final List<PieChartSectionData> paiChartSelectionData = [
            PieChartSectionData(
              color: primaryColor,
              value: 25,
              showTitle: false,
              radius: 25,
            ),
            PieChartSectionData(
              color: const Color(0xFF26E5FF),
              value: 20,
              showTitle: false,
              radius: 22,
            ),
            PieChartSectionData(
              color: const Color(0xFFFFCF26),
              value: 10,
              showTitle: false,
              radius: 19,
            ),
            PieChartSectionData(
              color: const Color(0xFFEE2727),
              value: 15,
              showTitle: false,
              radius: 16,
            ),
            PieChartSectionData(
              color: primaryColor.withOpacity(0.1),
              value: 25,
              showTitle: false,
              radius: 13,
            ),
          ];
          return SizedBox(
            height: 200,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    startDegreeOffset: -90,
                    sections: paiChartSelectionData,
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: defaultPadding),
                      Text(
                        state.users.length.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 0.5,
                            ),
                      ),
                      Text(state.users.length.toString())
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text(0.toString());
        }
      },
    );
  }
}
