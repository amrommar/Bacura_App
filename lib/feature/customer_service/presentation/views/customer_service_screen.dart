import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/index.dart';
import 'package:bacura_app/feature/customer_service/presentation/controller/chat_provider.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.service_customer_chat,
            ),
            actions: const [
              CustomerServiceAppBarWidget(),
            ]),
        body: ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(),
          child: Consumer<ChatProvider>(
            builder: (context, provider, child) => Column(children: [
              Expanded(
                  child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.pw16,
                        vertical: AppSizes.ph24,
                      ),
                      children: [
                    CustomerServiceMessageWidget(
                      sender: "خدمة العملاء",
                      message: "مرحبًا بك في خدمة الدردشة للعملاء.",
                      time: "11:25 ص",
                    ),
                    CustomerServiceMessageWidget(
                      sender: "خدمة العملاء",
                      message: "كيف يمكننا مساعدتك اليوم؟",
                      time: "11:26 ص",
                    ),
                    UserMessageWidget(message: "المدفوعات", time: "11:27 ص"),
                    CustomerServiceMessageWidget(
                      sender: "خدمة العملاء",
                      message: "حدد الموضوع الذي تحتاج إلى مساعدة فيه.",
                      time: "11:29 ص",
                    ),
                    UserMessageWidget(message: "عملية دفع", time: "11:30 ص"),
                    CustomerServiceMessageWidget(
                      sender: "خدمة العملاء",
                      message: "حدد طريقة الدفع التي تحتاج إلى مساعدة بشأنها",
                      time: "11:32 am",
                    ),
                  ])),
              const WriteMessageWidget()
            ]),
          ),
        ));
  }
}
