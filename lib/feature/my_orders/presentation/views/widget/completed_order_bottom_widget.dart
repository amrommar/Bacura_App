import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/invoice/api/pdf_api.dart';
import 'package:bacura_app/feature/invoice/api/pdf_invoice_api.dart';
import 'package:bacura_app/feature/invoice/model/customer.dart';
import 'package:bacura_app/feature/invoice/model/invoice.dart';
import 'package:bacura_app/feature/invoice/model/supplier.dart';
import 'package:bacura_app/feature/invoice/widget/button_widget.dart';

class CompletedOrderBottomWidget extends StatelessWidget {
  final List<Map<String, dynamic>> invoiceData;
  final String mobileNumber;
  final String name;
  final String address;

  CompletedOrderBottomWidget({
    super.key,
    required this.invoiceData,
    required this.mobileNumber,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: 'تحميل الفاتورة',
      onClicked: () async {
        final date = DateTime.now();
        final List<InvoiceItem> items = invoiceData.map((item) {
          return InvoiceItem(
            description: item['description'],
            date: item['date'] ?? DateTime.now(),
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
            number: '${DateTime.now().year}',
          ),
          items: items,
        );

        final pdfFile = await PdfInvoiceApi.generate(invoice);

        PdfApi.openFile(pdfFile);
      },
    );
  }
}
