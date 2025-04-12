import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/invoice/api/pdf_api.dart';
import 'package:bacura_app/feature/invoice/api/pdf_invoice_api.dart';
import 'package:bacura_app/feature/invoice/model/customer.dart';
import 'package:bacura_app/feature/invoice/model/invoice.dart';
import 'package:bacura_app/feature/invoice/model/supplier.dart';
import 'package:bacura_app/feature/invoice/widget/button_widget.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CompletedOrderBottomWidget extends StatelessWidget {
  final List<Map<String, dynamic>> invoiceData;
  final String mobileNumber;
  final String name;
  final String address;
  final int orderId;
  final DateTime date;

  CompletedOrderBottomWidget(
      {super.key,
      required this.invoiceData,
      required this.mobileNumber,
      required this.name,
      required this.address,
      required this.orderId,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        text: 'تحميل الفاتورة',
        onClicked: () async {
          final status = await Permission.storage.request();
          if (status.isGranted) {
            final List<InvoiceItem> items = invoiceData.map((item) {
              return InvoiceItem(
                description: item['description'],
                date: item['date'],
                quantity: item['quantity'],
                vat: item['vat'],
                unitPrice: item['unitPrice'],
              );
            }).toList();

            final invoice = Invoice(
              supplier: const Supplier(
                name: 'Bacura Tec',
                address: 'Al-Narjis, Anas Bin Malik Street',
                paymentInfo: 'https://paypal.me/sarahfieldzz',
              ),
              customer: Customer(
                mobileNumber: mobileNumber,
                name: name,
                address: address,
              ),
              info: InvoiceInfo(
                date: date,
                description: 'My description...',
                number: '$orderId',
              ),
              items: items,
            );

            final pdfFile = await PdfInvoiceApi.generate(invoice);

            final directory = Directory('/storage/emulated/0/Download');
            final filePath = '${directory.path}/Invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
            final newFile = File(filePath);
            await newFile.writeAsBytes(await pdfFile.readAsBytes());

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تم تحميل الفاتورة بنجاح: $filePath')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('يجب السماح بالوصول إلى التخزين لحفظ الفاتورة')),
            );
          }
        });
  }
}
