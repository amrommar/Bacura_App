import 'package:bacura_app/core/utils/index.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({super.key});

  @override
  State<CustomerServiceView> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceView> {
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
        body: Column(children: [
          Expanded(
              child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 24.h,
                  ),
                  children: [
                CustomerServiceMessageWidget(
                  sender: "Customer Support",
                  message: "Hey, welcome to Service Customer Chat.",
                  time: "11:25 am",
                ),
                CustomerServiceMessageWidget(
                  sender: "Customer Support",
                  message: "What can we assist you with today?",
                  time: "11:25 am",
                ),
                UserMessageWidget(message: "Payments", time: "11:25 am"),
                CustomerServiceMessageWidget(
                  sender: "Customer Support",
                  message: "Select a topic you need help with.",
                  time: "11:25 am",
                ),
                UserMessageWidget(message: "Make a payment", time: "11:25 am"),
                CustomerServiceMessageWidget(
                  sender: "Customer Support",
                  message: "Select a payment you need help with",
                  time: "11:25 am",
                ),
              ])),
          const WriteMessageWidget()
        ]));
  }
}
