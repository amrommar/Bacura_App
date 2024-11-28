import 'dart:io';

import 'package:bacura_app/core/providers/language_provider.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadImageFieldIcon extends StatefulWidget {
  String label;

  UploadImageFieldIcon({super.key, required this.label});

  @override
  _UploadImageFieldIconState createState() => _UploadImageFieldIconState();
}

class _UploadImageFieldIconState extends State<UploadImageFieldIcon> {
  File? _idImage;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image
  Future<void> _pickImage(bool isIdImage) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isIdImage) {
          _idImage = File(pickedFile.path);
        } else {
          _imageFile = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Stack(
      alignment: provider.appLanguage == 'en' ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        // Attach Button
        // Display label or "selected" message
        Container(
          height: 50,
          alignment: provider.appLanguage == 'en' ? Alignment.centerLeft : Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: ColorManager.lightWhiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _imageFile != null ? 'Image uploaded' : widget.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: _imageFile != null ? ColorManager.greenColor : ColorManager.greyColor,
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: ColorManager.primaryBlueColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
                onPressed: () => _pickImage(false),
                icon: Icon(
                  Icons.attach_file,
                  color: ColorManager.whiteColor,
                ))),
        // ElevatedButton(
        //   onPressed: () => _pickImage(false),
        //   style: ElevatedButton.styleFrom(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     backgroundColor: ColorManager.primaryBlueColor,
        //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //   ),
        //   child: const Text(
        //     'Attach',
        //     style: TextStyle(fontSize: 16, color: Colors.white),
        //   ),
        // ),
      ],
    ); //   _buildUploadRow( //   label: 'Personal Image *', //   imageFile: _personalImage, //   onAttachPressed: () => _pickImage(false), // ); } }
  }
}
