import 'package:bacura_app/feature/request_services/presentation/views/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
