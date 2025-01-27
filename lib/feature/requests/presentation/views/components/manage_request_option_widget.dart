import 'package:bacura_app/core/utils/index.dart';

class ManageRequestOptionWidget extends StatelessWidget {
  String text;
  IconData icon;
  Color iconColor;
  Function onTap;

  ManageRequestOptionWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ))),
          Icon(
            icon,
            size: AppSizes.ph30,
            color: iconColor,
          )
        ]));
  }
}
