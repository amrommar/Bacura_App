import 'package:bacura_app/feature/more/views/widgets/about_us_view_body.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const AboutUsViewBody(),
    );
  }
}
