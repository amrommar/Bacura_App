import 'package:bacura_app/core/utils/index.dart';

class CustomerServiceAppBarWidget extends StatefulWidget {
  const CustomerServiceAppBarWidget({super.key});

  @override
  State<CustomerServiceAppBarWidget> createState() => _CustomerServiceAppBarWidgetState();
}

class _CustomerServiceAppBarWidgetState extends State<CustomerServiceAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(AppSizes.ph8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.br50),
            child: Container(
                padding: EdgeInsets.all(AppSizes.ph5),
                color: ColorManager.whiteColor,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: AppSizes.ph30,
                  color: ColorManager.primaryBlueColor,
                ))));
  }
}
