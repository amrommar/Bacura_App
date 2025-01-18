import 'package:bacura_app/core/utils/index.dart';

class CustomSupportContainer extends StatelessWidget {
  String text;
  Function onTap;
  IconData icon;
  Widget widget;

  CustomSupportContainer({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: const EdgeInsets.all(12),
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              widget,
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4, top: 3),
                child: Text(text,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        )),
              )
            ])));
  }
}
