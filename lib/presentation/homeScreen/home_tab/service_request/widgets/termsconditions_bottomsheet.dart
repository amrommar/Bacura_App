import 'package:flutter/material.dart';

class Termsconditions_Bottomsheet extends StatefulWidget {
  @override
  State<Termsconditions_Bottomsheet> createState() =>
      _Termsconditions_BottomsheetState();
}

class _Termsconditions_BottomsheetState
    extends State<Termsconditions_Bottomsheet> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                '''Terms and Conditions
Welcome to Bakora
These terms and conditions provide the legal basis for your use of the application and its related services.
Acceptance of Terms: By using the application, you agree to be bound by these terms. If you do not agree to any of these terms, please do not
use the application
1. Definitions
 Application: refers to [application name] and all its services and related content.
 Services: means all services and features provided by the application.
 User: any person who uses the application or any of its services.
 Service Provider: any party that provides the actual services to end users or customers
 Service Provider: any party that provides the infrastructure, technologies or systems on which the application operates
2. Terms of Use
 Eligibility
Users must be of legal age to enter into a binding contract or have the consent of their parents or legal guardian to use the application.
 Acceptable Use
Users must use the App only for the purposes for which the App was designed and in a manner that does not infringe the rights of others or adversely affect the operation of the App. This includes not using the App for fraud, harassment, or any illegal use.
 Account Creation
You must create an account in order to use the App’s services.
 Attaching Documents
Use of some of the App’s services may require attaching documents. Users must provide true, accurate, and up-to-date information when submitting these documents, and ensure that all data and information provided complies with the specific requirements of the service.
 Continued Use
Once amendments to the Terms are posted, your use of the App after such update shall be deemed acceptance of the amended Terms.
 Termination of Use
We reserve the right to terminate or suspend your access to the App at any time, without prior notice, if you violate these Terms.
3. Intellectual Property Rights
All copyrights, trademarks, and other rights in the App and its contents are owned by us. No part of the App may be copied, distributed, or modified without our express permission.
4. Limitation of Liability
The Company disclaims any responsibility and does not guarantee that the application will be free from errors or defects or that the services will always be available.
5. Changes
 Modification of Terms: The Company has the right to modify these terms at any time.
 Cancellation of Service: The Company has the right to cancel the service or any part thereof at any time.
6. Contact Us
If you have any questions about these terms and conditions, please contact us at [email] or [phone number].''',
                // Add your full text here
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          CheckboxListTile(
            title: Text(
              'Accept the Privacy Policy and Terms and Conditions',
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity
                .leading, // places the checkbox to the left
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: isChecked
                ? () {
                    // Add your payment logic here
                  }
                : null, // Disable the button if not checked
            child: Text('المتابعة للدفع'),
            style: TextButton.styleFrom(
              backgroundColor: isChecked ? Colors.blue : Colors.grey,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
