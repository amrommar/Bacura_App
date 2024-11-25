import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceProviderNameRow extends StatelessWidget {
  const ServiceProviderNameRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(AppLocalizations.of(context)!.service_provider_name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryBlueColor,
                  )),
        ),
        Text('باكورة التقنيات',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                )),
      ],
    );
  }
}
