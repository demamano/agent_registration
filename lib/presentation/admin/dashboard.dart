import 'package:agent_registration/core/constant.dart';
import 'package:flutter/material.dart';

import 'Componenet/header.dart';
import 'Componenet/my_fields.dart';
import 'Componenet/recent_files.dart';
import 'Componenet/storage_details.dart';
import 'constants/constants.dart';
import 'constants/responsive.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.cOlor1,
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const MyFiles(),
                        const SizedBox(height: defaultPadding),
                        const RecentFiles(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          const StorageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 2,
                      child: StorageDetails(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
