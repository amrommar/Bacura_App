import 'package:bacura_app/feature/customer_service/presentation/views/widgets/customer_service_message.dart';
import 'package:bacura_app/feature/customer_service/presentation/views/widgets/user_message.dart';
import 'package:bacura_app/feature/customer_service/presentation/views/widgets/write_message_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerServiceViewBody extends StatelessWidget {
  const CustomerServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView(padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h), children: [
        CustomerServiceMessage(
            sender: "Customer Support", message: "Hey, welcome to Service Customer Chat.", time: "11:25 am"),
        CustomerServiceMessage(
            sender: "Customer Support", message: "What can we assist you with today?", time: "11:25 am"),
        UserMessage(message: "Payments", time: "11:25 am"),
        CustomerServiceMessage(
            sender: "Customer Support", message: "Select a topic you need help with.", time: "11:25 am"),
        UserMessage(message: "Make a payment", time: "11:25 am"),
        CustomerServiceMessage(
            sender: "Customer Support", message: "Select a payment you need help with", time: "11:25 am"),
      ])),
      const WriteMessageSection()
    ]);
  }
}
