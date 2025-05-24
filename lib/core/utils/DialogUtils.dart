import 'package:bacura_app/core/utils/index.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget content;
  final VoidCallback onCancel;
  final VoidCallback onOk;
  final bool isOk;
  final bool isCancel;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.imagePath,
    required this.content,
    required this.onCancel,
    required this.onOk,
    this.isOk = true,
    this.isCancel = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          contentPadding: const EdgeInsets.all(16),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.sp18,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.4,
              maxWidth: constraints.maxWidth * 0.9,
            ),
            child: SingleChildScrollView(
              child: content,
            ),
          ),
          actions: [
            if (isCancel)
              TextButton(
                onPressed: onCancel,
                child: Text(
                  tr(AppStrings.cancel),
                  style: TextStyle(
                    color: ColorManager.blackColor,
                    fontSize: AppSizes.sp16,
                  ),
                ),
              ),
            if (isOk)
              TextButton(
                onPressed: onOk,
                child: Text(
                  tr(AppStrings.ok),
                  style: TextStyle(
                    color: ColorManager.blackColor,
                    fontSize: AppSizes.sp16,
                  ),
                ),
              ),
          ],
        );
      },
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
