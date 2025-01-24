import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/header_modal_bottom_sheet_defult.dart';
import 'package:flutter/material.dart';

class EditDataBottomSheet extends StatefulWidget {
  const EditDataBottomSheet({super.key, required this.bottomSheetContent, this.backgroundColor});

  final Widget bottomSheetContent;
  final Color? backgroundColor;

  @override
  State<EditDataBottomSheet> createState() => _EditDataBottomSheetState();
}

class _EditDataBottomSheetState extends State<EditDataBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.backgroundColor, borderRadius: BorderRadius.circular(AppSizes.br16)),
      padding: EdgeInsets.all(AppSizes.pw16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const HeaderModalBottomSheetDefault(), Flexible(child: widget.bottomSheetContent)],
        ),
      ),
    );
  }
}
