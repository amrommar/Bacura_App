import 'package:bacura_app/ServiceProvider_App/presentation/wigdets/completedrequest_container.dart';
import 'package:flutter/material.dart';

class Sp_Completedrequests_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات المنجزة'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Completedrequest_Container();
        },
      ),
    );
  }
}
