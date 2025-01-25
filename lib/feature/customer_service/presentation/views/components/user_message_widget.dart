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
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorManager.lightBlueColor,
            borderRadius: BorderRadius.circular(15),
          ),
          // Let the content decide the width
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(message),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey))
          ])),
    );
  }
}
