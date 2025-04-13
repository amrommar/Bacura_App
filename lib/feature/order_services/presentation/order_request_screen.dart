import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/order_services_provider.dart';

class OrderRequestScreen extends StatelessWidget {
  final int? serviceId;
  final int? categoryId;

  const OrderRequestScreen({super.key, this.serviceId, this.categoryId});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
            title: Text(
          tr(AppStrings.orderDetails),
        )),
        body: Consumer<OrderServicesProvider>(
          builder: (context, provider, child) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.ph18,
              horizontal: AppSizes.pw16,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr(AppStrings.setDate),
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorManager.blackColor,
                              )),
                      ServiceTimePickerWidget(
                          initTime: provider.selectedDate,
                          onChange: (DateTime dateTime) {
                            provider.onDateChanged(dateTime);
                          }),

                      SizedBox(height: AppSizes.ph10),
                      CustomDropDownField(
                        selectedOption: provider.selectedOption,
                        options: provider.options,
                        fieldName: tr(AppStrings.setTime),
                        onChanged: (String? newValue) {
                          provider.onTimeChanged(
                            provider.selectedOption,
                          );
                        },
                      ),
                      CustomQuestionTextFormField(
                        fieldName: tr(AppStrings.location),
                        hintText: tr(AppStrings.pleaseSelectLocation),
                        controller: provider.locationController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return tr(AppStrings.pleaseSelectLocation);
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
                        fieldName: tr(AppStrings.serviceDescription),
                        hintText: tr(AppStrings.enterServiceDescription),
                        controller: provider.descriptionController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return tr(AppStrings.enterServiceDescription);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSizes.ph100),
                      Center(
                        child: CustomSmallElevatedButton(
                          text: tr(AppStrings.sendRequest),
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              provider.sendOrderRequest(serviceId, categoryId, context: context);
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
