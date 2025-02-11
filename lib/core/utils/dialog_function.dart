import 'package:bacura_app/core/utils/index.dart';

void customShowCustomDialog(
    {required BuildContext context,
    required String title,
    required String imagePath,
    required String content,
    required Function() onCancel,
    required Function() onOk,
    required bool isCancel,
    required bool isOk}) {
  showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(
      title: title,
      imagePath: imagePath,
      content: Text(content),
      onCancel: onCancel,
      onOk: onOk,
      isOk: isOk,
      isCancel: isCancel,
    ),
  );
}
