import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/order_services_provider.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final int? serviceId;
  final int? categoryId;

  const ServiceDetailsScreen({super.key, this.serviceId, this.categoryId});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.service_details,
        )),
        body: Consumer<orderServicesProvider>(
          builder: (context, provider, child) => Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.ph18, horizontal: AppSizes.pw16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.set_date,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorManager.blackColor,
                              )),
                      const ServiceTimePickerWidget(),

                      SizedBox(height: AppSizes.ph10),
                      CustomDropDownField(
                        selectedOption: provider.selectedOption,
                        options: provider.options,
                        fieldName: AppLocalizations.of(context)!.set_time,
                        onChanged: (String? newValue) {
                          provider.onTimeChanged(provider.selectedOption);
                        },
                      ),
                      CustomQuestionTextFormField(
                        fieldName: AppLocalizations.of(context)!.location,
                        hintText: AppLocalizations.of(context)!.click_icon_location,
                        controller: provider.locationController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.please_set_location;
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            provider.showLocationBottomSheet(context: context);
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
                        controller: provider.descriptionController,
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
                              provider.sendOrderRequest(widget.serviceId, widget.categoryId);
                              // showordersentBottomSheet();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
