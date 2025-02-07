import 'package:bacura_app/core/utils/index.dart';

class CustomerNameWidget extends StatelessWidget {
  const CustomerNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('اسم العميل: ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.darkBlueColor,
              )),
      Text('محمد صلاح',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontWeight: FontWeight.bold,
              ))
    ]);
  }
}
