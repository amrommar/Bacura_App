import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/personal_details_view_body.dart';
import 'package:flutter/material.dart';

class PersonalDetails_Screen extends StatefulWidget {
  const PersonalDetails_Screen({super.key});

  @override
  State<PersonalDetails_Screen> createState() => _PersonalDetails_ScreenState();
}

class _PersonalDetails_ScreenState extends State<PersonalDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(elevation: 0),
      body: const PersonalDetailsViewBody(),
    );
  }
}
