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
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                padding: const EdgeInsets.all(5),
                color: ColorManager.whiteColor,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: 30,
                  color: ColorManager.primaryBlueColor,
                ))));
  }
}
