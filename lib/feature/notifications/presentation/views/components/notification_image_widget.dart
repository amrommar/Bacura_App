import 'package:bacura_app/core/utils/index.dart';

class NotificationImageWidget extends StatelessWidget {
  const NotificationImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
              color: ColorManager.midWhiteColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3) // Offset in the x and y directions
              )
        ]),
        child: CircleAvatar(
            radius: 30.w,
            backgroundColor: ColorManager.whiteColor,
            ///////////////    from Back-End     /////////////////////
            child: Image.asset('assets/images/bakura (1) 1.png') // Adjust the radius to make sure it fits
            ));
  }
}
