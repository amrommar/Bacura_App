import 'package:bacura_app/core/utils/index.dart';

class CustomQuestionTextFormField extends StatefulWidget {
  final String fieldName;
  final String hintText;
  final Widget? suffixIcon;
  final bool isObsucre;
  final int maxLines;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomQuestionTextFormField({
    super.key,
    required this.fieldName,
    this.maxLines = 1,
    required this.hintText,
    this.suffixIcon,
    this.isObsucre = false,
    this.validator,
    required this.controller,
    this.keyBoardType = TextInputType.text,
  });

  @override
  State<CustomQuestionTextFormField> createState() => _CustomQuestionTextFormFieldState();
}

class _CustomQuestionTextFormFieldState extends State<CustomQuestionTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.ph6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorManager.darkBlueColor),
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            keyboardType: widget.keyBoardType,
            obscureText: widget.isObsucre,
            decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.lightGreyColor,
                      width: AppSizes.pw1,
                    ),
                    borderRadius: BorderRadius.circular(AppSizes.br8)),
                contentPadding: EdgeInsets.only(left: AppSizes.pw8, right: AppSizes.pw8, top: AppSizes.ph10, bottom: AppSizes.ph10),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.greyColor)),
          )
        ],
      ),
    );
  }
}
