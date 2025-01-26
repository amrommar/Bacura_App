import 'package:bacura_app/core/utils/index.dart';

class EditCardBottomSheet extends StatefulWidget {
  @override
  State<EditCardBottomSheet> createState() => _EditCardBottomSheetState();
}

class _EditCardBottomSheetState extends State<EditCardBottomSheet> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mmyyController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // Mask formatter for MM/YY format
  final maskFormatter = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // Get the height of the keyboard to avoid overlapping
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Form(
          key: formKey,
          child: Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.br20),
              ),
              padding: EdgeInsets.all(AppSizes.ph16),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Enter Card Number TextField
                      CardCustom_TxtField(
                          hintText: AppLocalizations.of(context)!.enter_card_number,
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!.please_enter_card_number;
                            }
                            return null;
                          }),

                      /// Enter Expiry Date & CVV TextField
                      Row(children: [
                        Expanded(
                            child: CardCustom_TxtField(
                                hintText: AppLocalizations.of(context)!.cvv,
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                inputFormatter: [
                                  LengthLimitingTextInputFormatter(3), // Limit to 3 characters
                                  FilteringTextInputFormatter.digitsOnly, // Only allow digits
                                ],
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.please_enter_cvv;
                                  }
                                  return null;
                                })),
                        SizedBox(width: AppSizes.pw8),
                        // Add space between the fields
                        Expanded(
                            child: CardCustom_TxtField(
                                hintText: AppLocalizations.of(context)!.mm_yy,
                                controller: mmyyController,
                                keyboardType: TextInputType.number,
                                inputFormatter: [maskFormatter],
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return AppLocalizations.of(context)!.please_enter_mm_yy;
                                  }
                                  return null;
                                }))
                      ]),

                      /// Enter Name TextField
                      CardCustom_TxtField(
                          hintText: AppLocalizations.of(context)!.fullName,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppLocalizations.of(context)!.pleaseEnterYourName;
                            }
                            return null;
                          }),
                      SizedBox(height: AppSizes.ph30),

                      /// Add To Cart Elevated Button
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  maximumSize: Size(AppSizes.pw240, AppSizes.ph50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppSizes.br30),
                                  )),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                Text(AppLocalizations.of(context)!.edit_credit,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold)),
                                Icon(Icons.add_card, color: ColorManager.whiteColor)
                              ])))
                    ]),
              )),
        ));
  }
}

class CardCustom_TxtField extends StatelessWidget {
  String hintText;
  bool isObsucre;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;
  List<TextInputFormatter>? inputFormatter;

  CardCustom_TxtField(
      {required this.hintText,
      this.isObsucre = false,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: AppSizes.ph8,
          right: AppSizes.pw8,
          left: AppSizes.pw8,
        ),
        child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: isObsucre,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.soLightGreyColor,
                // Background color of the TextFormField
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.greyColor,
                    ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppSizes.ph4,
                  horizontal: AppSizes.pw12,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.br10),
                    // Rounded corners
                    borderSide: const BorderSide(color: Colors.white) // Border color
                    ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.br10),
                  borderSide: BorderSide(color: ColorManager.whiteColor),
                ),
                // Border color when not focused
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.br10),
                    borderSide: BorderSide(
                      color: ColorManager.whiteColor, // Border color when focused
                    )))));
  }
}
