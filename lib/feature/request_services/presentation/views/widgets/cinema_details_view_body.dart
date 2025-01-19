import 'package:bacura_app/core/utils/index.dart';

class CinemaDetailsViewBody extends StatefulWidget {
  const CinemaDetailsViewBody({super.key});

  @override
  State<CinemaDetailsViewBody> createState() => _CinemaDetailsViewBodyState();
}

class _CinemaDetailsViewBodyState extends State<CinemaDetailsViewBody> {
  var cameraTypeController = TextEditingController();
  var camerasNumberController = TextEditingController();
  var propertyTypeController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String selectedOption = '9 ص - 1 م';
  final List<String> options = ['9 ص - 1 م', '1 م - 6 م'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ////////////////////     Styled Introductory Title Section     /////////////////////////////////////////
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.darkBlueColor,
                        ColorManager.midBlueColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "لا تقطع المسافات للترفيه... دع السينما تأتي إليك!",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),

                ////////////////////     Set date Section     /////////////////////////////////////////
                Text(
                  AppLocalizations.of(context)!.set_date,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.blackColor,
                      ),
                ),
                const ServiceTimePicker(),
                ////////////////////     Set Time Section     /////////////////////////
                SizedBox(height: 10.h),
                CustomDropDownField(
                  selectedOption: '9 ص - 1 م',
                  options: options,
                  fieldName: AppLocalizations.of(context)!.set_time,
                ),

                //// Set location Section ///////////////////////////////////////
                questionTextFormField(
                  fieldName: AppLocalizations.of(context)!.location,
                  hintText: AppLocalizations.of(context)!.click_icon_location,
                  controller: locationController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_set_location;
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () {
                      showLocationBottomSheet(locationController);
                    },
                    child: Icon(
                      Icons.location_on_outlined,
                      color: ColorManager.midBlueColor,
                      size: 27,
                    ),
                  ),
                ),
                //// Write Service Description Section ///////////////////////////////////////
                questionTextFormField(
                  fieldName: AppLocalizations.of(context)!.service_description,
                  hintText: AppLocalizations.of(context)!.enter_service_description,
                  controller: descriptionController,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_describe_your_consultation;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100.h),
                Center(
                  child: SmallElevatedButton(
                    text: AppLocalizations.of(context)!.send_request,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        showRequestSentBottomSheet();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSent_BottomSheet();
        });
  }

  void showLocationBottomSheet(TextEditingController locationController) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SetLocationBottomSheet(
            locationController: locationController,
          );
        });
  }
}
