import 'package:bacura_app/core/utils/index.dart';

class ConsultationDropDownField extends StatefulWidget {
  ConsultationDropDownField({super.key});

  @override
  State<ConsultationDropDownField> createState() => _ConsultationDropDownFieldState();
}

class _ConsultationDropDownFieldState extends State<ConsultationDropDownField> {
  final List<String> options = ['استشارة تقنية', 'استشارة فنية', 'استشارة مالية', 'استشارة إدارية'];

  String selectedOption = 'استشارة تقنية';

  @override
  Widget build(BuildContext context) {
    return CustomDropDownField(
      selectedOption: selectedOption,
      options: options,
      fieldName: AppLocalizations.of(context)!.consultation_type,
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue!;
        });
      },
    );
  }
}
