import 'package:bacura_app/core/utils/index.dart';

class UserMessageWidget extends StatelessWidget {
  String message;
  String time;

  UserMessageWidget({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Align(
      alignment: provider.appLanguage == AppStrings.en ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin: EdgeInsets.only(bottom: AppSizes.ph10),
          padding: EdgeInsets.all(AppSizes.ph12),
          decoration: BoxDecoration(
            color: ColorManager.lightBlueColor,
            borderRadius: BorderRadius.circular(AppSizes.br15),
          ),
          // Let the content decide the width
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(message),
            SizedBox(height: AppSizes.ph5),
            Text(time, style: TextStyle(fontSize: AppSizes.sp12, color: Colors.grey))
          ])),
    );
  }
}
