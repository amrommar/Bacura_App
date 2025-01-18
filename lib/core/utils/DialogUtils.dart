import 'package:bacura_app/core/utils/index.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget content;
  final VoidCallback onCancel;
  final VoidCallback onOk;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.content,
    required this.onCancel,
    required this.onOk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: Image.asset(
              imagePath,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      content: content,
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(color: ColorManager.blackColor, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: onOk,
          child: Text(
            AppLocalizations.of(context)!.ok,
            style: TextStyle(color: ColorManager.blackColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

// import 'package:bacura_app/core/utils/color_manager.dart';
// import 'package:flutter/material.dart';
//
// class DialogUtils {
//   static void showLoading({required BuildContext context, required String message, bool isDismissible = true}) {
//     showDialog(
//       barrierDismissible: isDismissible,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: ColorManager.whiteColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           content: Row(
//             children: [
//               CircularProgressIndicator(color: ColorManager.primaryBlueColor),
//               SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 message,
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.darkBlueColor),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   static void hideLoading(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   static void showMessage({
//     required BuildContext context,
//     required String message,
//     String title = '',
//     String? posActionName,
//     Function? posAction,
//     String? negActionName,
//     Function? negAction,
//     bool isDismissible = true,
//   }) {
//     GlobalKey<State> key = GlobalKey<State>();
//     showDialog(
//       barrierDismissible: isDismissible,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           key: key,
//           backgroundColor: ColorManager.whiteColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           title: Text(
//             title,
//             style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: ColorManager.primaryBlueColor,
//                 ),
//           ),
//           content: Text(
//             message,
//             style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
//           ),
//           actions: [
//             if (posActionName != null)
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(key.currentContext!);
//                   posAction?.call();
//                 },
//                 child: Text(
//                   posActionName,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor),
//                 ),
//               ),
//             if (negActionName != null)
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(key.currentContext!);
//                   negAction?.call();
//                 },
//                 child: Text(
//                   negActionName,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.primaryBlueColor),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// // static void showMessage(
// //     {required BuildContext context,
// //     required String message,
// //     required AppConfigProvider provider,
// //     String title = '',
// //     String? posActionName,
// //     Function? posAction,
// //     String? negActionName,
// //     Function? negAction,
// //     bool isDismissible = true}) {
// //   List<Widget> actions = [];
// //   if (posActionName != null) {
// //     actions.add(TextButton(
// //         onPressed: () {
// //           Navigator.pop(context);
// //           posAction?.call();
// //         },
// //         child: Text(
// //           posActionName,
// //           style: Theme.of(context)
// //               .textTheme
// //               .titleSmall!
// //               .copyWith(color: MyTheme.primaryColor),
// //         )));
// //   }
// //   if (negActionName != null) {
// //     actions.add(TextButton(
// //         onPressed: () {
// //           Navigator.pop(context);
// //           negAction?.call();
// //         },
// //         child: Text(
// //           negActionName,
// //           style: Theme.of(context)
// //               .textTheme
// //               .titleSmall!
// //               .copyWith(color: MyTheme.primaryColor),
// //         )));
// //   }
// //   showDialog(
// //     barrierDismissible: isDismissible,
// //     context: context,
// //     builder: (context) {
// //       return AlertDialog(
// //         backgroundColor: provider?.appTheme == ThemeMode.dark
// //             ? MyTheme.blackDarkColor
// //             : MyTheme.whiteColor,
// //         shape:
// //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //         title: Text(
// //           title,
// //           style: TextStyle(
// //             color: provider?.appTheme == ThemeMode.dark
// //                 ? MyTheme.whiteColor
// //                 : MyTheme.blackColor,
// //           ),
// //         ),
// //         content: Text(
// //           message,
// //           style: Theme.of(context)
// //               .textTheme
// //               .titleMedium!
// //               .copyWith(color: MyTheme.primaryColor),
// //         ),
// //         actions: actions,
// //       );
// //     },
// //   );
// // }
// }
