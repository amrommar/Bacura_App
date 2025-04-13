import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/presentation/controller/chat_provider.dart';

class WriteMessageWidget extends StatelessWidget {
  const WriteMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw8,
          vertical: AppSizes.ph10,
        ),
        height: AppSizes.ph60,
        color: ColorManager.midWhiteColor,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.attachment,
                color: Colors.grey,
                size: AppSizes.ph22,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: TextFormField(
                controller: provider.messageController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorManager.whiteColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.midWhiteColor,
                      width: AppSizes.pw1,
                    ),
                    borderRadius: BorderRadius.circular(AppSizes.br8),
                  ),
                  hintText: tr(AppStrings.typeMessageHere),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: ColorManager.primaryBlueColor,
                size: AppSizes.ph22,
              ),
              onPressed: () {
                provider.sendMessage(
                  content: provider.messageController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
