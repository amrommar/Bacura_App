import 'package:bacura_app/core/utils/index.dart';

class UploadImageWidget extends StatefulWidget {
  String label;

  UploadImageWidget({super.key, required this.label});

  @override
  _UploadImageWidgetState createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
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
          height: AppSizes.ph50,
          alignment: provider.appLanguage == 'en' ? Alignment.centerLeft : Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw16),
          decoration: BoxDecoration(
            color: ColorManager.lightWhiteColor,
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          child: Text(
            _imageFile != null ? AppLocalizations.of(context)!.image_uploaded : widget.label,
            style: TextStyle(
              fontSize: AppSizes.sp18,
              fontWeight: FontWeight.normal,
              color: _imageFile != null ? ColorManager.greenColor : ColorManager.greyColor,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _pickImage(false),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
            backgroundColor: ColorManager.primaryBlueColor,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24, vertical: AppSizes.ph12),
          ),
          child: Text(
            AppLocalizations.of(context)!.attach,
            style: TextStyle(fontSize: AppSizes.ph16, color: Colors.white),
          ),
        ),
      ],
    ); //   _buildUploadRow( //   label: 'Personal Image *', //   imageFile: _personalImage, //   onAttachPressed: () => _pickImage(false), // ); } }
  }
}
