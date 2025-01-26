import 'package:bacura_app/core/utils/index.dart';

class CustomerServiceMessageWidget extends StatelessWidget {
  String sender;
  String message;
  String time;

  CustomerServiceMessageWidget({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.headset_mic_outlined,
            color: ColorManager.primaryBlueColor,
          )),
      SizedBox(width: AppSizes.pw8),
      Container(
          margin: EdgeInsets.only(bottom: AppSizes.ph10),
          padding: EdgeInsets.all(AppSizes.ph12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(AppSizes.br16),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              sender,
              style: TextStyle(
                color: ColorManager.darkBlueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.ph5),
            Text(message),
            Text(
              time,
              style: TextStyle(fontSize: AppSizes.sp12, color: Colors.grey),
            )
          ]))
    ]);
  }
}
