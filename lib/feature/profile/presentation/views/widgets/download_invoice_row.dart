import 'package:bacura_app/core/utils/index.dart';

class DownloadInvoiceRow extends StatelessWidget {
  const DownloadInvoiceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(AppLocalizations.of(context)!.download_invoice,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
              )),
      SizedBox(width: 10.w),
      Icon(
        Icons.download_outlined,
        color: ColorManager.darkBlueColor,
        size: 25,
      ),
    ]);
  }
}
