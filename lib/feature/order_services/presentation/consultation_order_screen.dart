import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/consultation_request_provider.dart';

class ConsultationOrderScreen extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const ConsultationOrderScreen({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (context) => ConsultationRequestProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr(AppStrings.consultationScreen)),
        ),
        body: Consumer<ConsultationRequestProvider>(
          builder: (context, provider, child) {
            return Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.pw16,
                  vertical: AppSizes.ph8,
                ),
                child: ListView(
                  children: [
                    /// drop down to choose type of consultation
                    CustomDropDownField(
                      selectedOption: categoryEntity.services[provider.selectedServiceIndex].name ?? '',
                      options: categoryEntity.services.map((service) => service.name ?? '').toList(),
                      fieldName: tr(AppStrings.consultationType),
                      onChanged: (String? newValue) {
                        provider.selectedOption = newValue!;
                        provider.selectedServiceIndex = categoryEntity.services.indexWhere(
                          (element) => element.name == newValue,
                        );
                      },
                    ),

                    /// consultation description
                    CustomQuestionTextFormField(
                      fieldName: tr(AppStrings.consultationDescription),
                      hintText: tr(AppStrings.describeYourConsultation),
                      controller: provider.descriptionController,
                      maxLines: 6,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return tr(AppStrings.pleaseDescribeYourConsultation);
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: AppSizes.ph10),

                    /// note of the consultation response
                    const ConsultationNoteWidget(),

                    SizedBox(height: AppSizes.ph100),

                    Center(
                      child: CustomSmallElevatedButton(
                        text: tr(AppStrings.send),
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            provider.sendOrderRequest(
                              context: context,
                              serviceId: categoryEntity.services[provider.selectedServiceIndex].id,
                              categoryId: categoryEntity.id!,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
