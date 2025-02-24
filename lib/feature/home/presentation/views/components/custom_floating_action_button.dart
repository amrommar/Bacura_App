import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  bool isFocused = false;
  bool hasClickedOnce = false; // Tracks whether the FAB has been clicked once

  @override
  Widget build(BuildContext context) {
    // Check the current text direction (LTR or RTL)
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Stack(children: [
      AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        bottom: AppSizes.ph5,
        // Adjust position based on text direction
        left: isRTL
            ? (isFocused
                ? MediaQuery.of(context).size.width - 100.w // RTL focused
                : MediaQuery.of(context).size.width - 60.w) // RTL default
            : (isFocused
                ? MediaQuery.of(context).size.width - 400.w // LTR focused
                : MediaQuery.of(context).size.width - 430.w),
        // LTR default
        child: AnimatedOpacity(
          opacity: isFocused ? 1.0 : 0.6,
          duration: const Duration(milliseconds: 500),
          child: Container(
            height: AppSizes.ph60,
            width: AppSizes.pw62,
            padding: EdgeInsets.all(AppSizes.ph10),
            decoration: BoxDecoration(
              color: ColorManager.primaryBlueColor,
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (!isFocused) {
                    // First click focuses the button
                    isFocused = true;
                    hasClickedOnce = true;
                  } else if (hasClickedOnce) {
                    final profileProvider = Provider.of<MyProfileProvider>(context, listen: false);
                    profileProvider.token == null
                        ? customShowCustomDialog(
                            context: context,
                            title: 'تسجيل الدخول',
                            imagePath: 'assets/images/png/bad-feedback.png',
                            content: 'الرجاء تسجيل الدخول اولاً',
                            isOk: true,
                            isCancel: true,
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onOk: () {
                              Navigator.pushNamed(context, Routes.loginRoute);
                            },
                          )
                        : Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const ProfileDetailsScreen()));

                    // Second click navigates to the route
                  }
                });
              },
              backgroundColor: ColorManager.transparent,
              child: Icon(
                Icons.headset_mic_outlined,
                color: ColorManager.whiteColor,
                size: AppSizes.ph40,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
