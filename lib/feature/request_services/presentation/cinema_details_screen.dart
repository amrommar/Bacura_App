import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/index.dart';

class CinemaDetailsScreen extends StatefulWidget {
  const CinemaDetailsScreen({super.key});

  @override
  State<CinemaDetailsScreen> createState() => _CinemaDetailsScreenState();
}

class _CinemaDetailsScreenState extends State<CinemaDetailsScreen> {
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
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.service_details,
        )),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.ph18, horizontal: AppSizes.pw16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////////////////////     Styled Introductory Title Section     /////////////////////////////////////////
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph16),
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
                        borderRadius: BorderRadius.circular(AppSizes.br12),
                      ),
                      child: Text(
                        "لا تقطع المسافات للترفية... دع السينما تأتي إليك!",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: ColorManager.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.sp20,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: AppSizes.ph20),

                    ////////////////////     Set date Section     /////////////////////////////////////////
                    Text(
                      AppLocalizations.of(context)!.set_date,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.blackColor,
                          ),
                    ),
                    const ServiceTimePickerWidget(),
                    ////////////////////     Set Time Section     /////////////////////////
                    SizedBox(height: AppSizes.ph10),
                    CustomDropDownField(
                      selectedOption: '9 ص - 1 م',
                      options: options,
                      fieldName: AppLocalizations.of(context)!.set_time,
                    ),

                    //// Set location Section ///////////////////////////////////////
                    CustomQuestionTextFormField(
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
                          size: AppSizes.ph28,
                        ),
                      ),
                    ),
                    //// Write Service Description Section ///////////////////////////////////////
                    CustomQuestionTextFormField(
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
                    SizedBox(height: AppSizes.ph100),
                    Center(
                      child: CustomSmallElevatedButton(
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
        ));
  }

  void showRequestSentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return RequestSentBottomSheet();
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
