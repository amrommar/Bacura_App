import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:bacura_app/feature/getStarted/presentation/views/get_started_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetstartedView(),
                  ),
                  ModalRoute.withName(Routes.getStartedRoute)); // Will remove all routes until this one
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.login_outlined,
                    color: ColorManager.whiteColor,
                    size: 25,
                  )
                ])));
  }
}
