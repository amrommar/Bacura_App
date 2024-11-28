import 'package:bacura_app/feature/technician_app/personal/presentation/views/widgets/sp_completed_request_container.dart';
import 'package:flutter/material.dart';

class Sp_Completedrequests_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات المنجزة'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SpCompletedRequestContainer();
        },
      ),
    );
  }
}
