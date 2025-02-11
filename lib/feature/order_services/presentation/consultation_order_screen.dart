import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/consultation_request_provider.dart';

class ConsultationOrderScreen extends StatelessWidget {
  CategoryEntity categoryEntity;

  ConsultationOrderScreen({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (context) => ConsultationRequestProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.consultation_screen),
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
                      child: ListView(children: [
                        /// drop down to choose type of consultation
                        CustomDropDownField(
                          selectedOption: provider.selectedOption,
                          options: categoryEntity.services.map((service) => service.name ?? '').toList(),
                          fieldName: AppLocalizations.of(context)!.consultation_type,
                          onChanged: (String? newValue) {
                            provider.selectedOption = newValue!;
                          },
                        ),

                        /// consultation description
                        CustomQuestionTextFormField(
                            fieldName: AppLocalizations.of(context)!.consultation_description,
                            hintText: AppLocalizations.of(context)!.describe_your_consultation,
                            controller: provider.descriptionController,
                            maxLines: 6,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!.please_describe_your_consultation;
                              }
                              return null;
                            }),
                        SizedBox(height: AppSizes.ph10),

                        /// note of the consultation response
                        const ConsultationNoteWidget(),
                        SizedBox(height: AppSizes.ph100),
                        Center(
                            child: CustomSmallElevatedButton(
                                text: AppLocalizations.of(context)!.send,
                                onPressed: () {
                                  if (formKey.currentState?.validate() == true) {
                                    provider.sendOrderRequest(categoryId: categoryEntity.id);
                                  }
                                }))
                      ])));
            },
          )),
    );
  }
}
