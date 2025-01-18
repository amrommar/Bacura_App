import 'package:bacura_app/core/utils/index.dart';

class CustomerNameRow extends StatelessWidget {
  const CustomerNameRow({super.key});

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
