import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ServiceProviderRegisterContainer extends StatelessWidget {
  IconData iconData;
  String title;
  String description;
  String note;
  Function() onTap;

  ServiceProviderRegisterContainer({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.title,
    required this.description,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: ColorManager.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: ColorManager.lightGreyColor,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.blackColor,
                      )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorManager.midWhiteColor,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.primaryBlueColor,
                    )),
            const SizedBox(height: 10),
            Text(note,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.greyColor,
                    )),
            const SizedBox(height: 26),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      onTap();
                    },
                    child: Text(
                      'Register Now',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            const SizedBox(height: 10),
          ]),
        ),
      ],
    );
  }
}
