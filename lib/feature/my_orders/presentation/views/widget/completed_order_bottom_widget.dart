import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/invoice/api/pdf_invoice_api.dart';
import 'package:bacura_app/feature/invoice/model/customer.dart';
import 'package:bacura_app/feature/invoice/model/invoice.dart';
import 'package:bacura_app/feature/invoice/model/supplier.dart';
import 'package:bacura_app/feature/invoice/widget/button_widget.dart';
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
        text: tr(AppStrings.downloadInvoice),
        onClicked: () async {
          final status = await Permission.manageExternalStorage.request();
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
                address: 'Riyadh-Jeddah-Dammam-Khobar-Medina-Khamis Mushait-Jazan',
                paymentInfo: 'SA1710000049400000475403',
                commercialRegister: '1010822013',
                email: 'info@bacuratec.com',
                mobilePhone: '+966 547000015',
              ),
              customer: Customer(
                mobileNumber: mobileNumber,
                name: name,
                address: address,
              ),
              info: InvoiceInfo(
                date: date,
                number: '$orderId',
              ),
              items: items,
            );

            final pdfFile = await PdfInvoiceApi.generate(invoice);
            final directory = Directory('/storage/emulated/0/Download');
            final filePath = '${directory.path}/Invoice_${orderId}.pdf';
            final newFile = File(filePath);
            await newFile.writeAsBytes(await pdfFile.readAsBytes());

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${tr(AppStrings.invoiceDownLoaded)} $filePath')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(tr(AppStrings.StorageAccessMustAllowed))),
            );
          }
        });
  }
}
