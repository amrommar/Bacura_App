import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/cinema_order_provider.dart';

class CinemaOrderScreen extends StatelessWidget {
  final int categoryId;

  const CinemaOrderScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider<CinemaOrderProvider>(
      create: (context) => CinemaOrderProvider(),
      child: Consumer<CinemaOrderProvider>(
        builder: (context, provider, child) => Scaffold(
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

                        Text(
                          AppLocalizations.of(context)!.set_date,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorManager.blackColor,
                              ),
                        ),
                        ServiceTimePickerWidget(
                            initTime: provider.selectedDate,
                            onChange: (DateTime dateTime) {
                              provider.onDateChanged(dateTime);
                            }),
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
                                provider.sendOrderRequest(categoryId: categoryId);
                                // provider.showOrderSentBottomSheet(context: context);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
