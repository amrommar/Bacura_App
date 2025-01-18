import 'package:bacura_app/core/utils/index.dart';

class ConsultationDropDownField extends StatelessWidget {
  ConsultationDropDownField({super.key});

  final List<String> options = ['استشارة 1', 'استشارة 2', 'استشارة 3'];

  @override
  Widget build(BuildContext context) {
    return DropDown_Field(
      selectedOption: 'استشارة 1',
      options: options,
      fieldName: AppLocalizations.of(context)!.consultation_type,
    );
  }
}
