import 'package:bacura_app/core/utils/index.dart';

class CustomerRequestComponents extends StatelessWidget {
  const CustomerRequestComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: ColorManager.lightBlueColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Expanded(
              child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.blackColor,
                      )));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: ColorManager.whiteColor,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
