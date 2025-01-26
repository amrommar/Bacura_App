import 'package:bacura_app/core/utils/index.dart';

class CustomTextFormField extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscures;
  var keyBoardType;
  String? Function(String?)? validator;
  TextEditingController controller;

  CustomTextFormField({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.suffixIcon,
    this.isObscures = false,
    this.validator,
    required this.controller,
    this.keyBoardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkBlueColor,
              ),
        ),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkBlueColor,
              ),
          validator: validator,
          controller: controller,
          keyboardType: keyBoardType,
          obscureText: isObscures,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.greyColor,
                  )),
        )
      ],
    );
  }
}
