import 'package:bacura_app/core/localization/ar.dart';
import 'package:bacura_app/core/localization/en.dart';
import 'package:get/get.dart';

class LanguageTranslation extends Translations {
  Map<String, String> en = coreEn;
  Map<String, String> ar = coreAr;

  LanguageTranslation();

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
