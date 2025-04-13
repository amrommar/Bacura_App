import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/index.dart';
import 'package:bacura_app/feature/customer_service/presentation/controller/chat_provider.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(AppStrings.customerSupportChat),
        ),
        actions: const [
          CustomerServiceAppBarWidget(),
        ],
      ),
      body: ChangeNotifierProvider<ChatProvider>(
        create: (context) => ChatProvider(),
        child: Consumer<ChatProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: provider.scrollController,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.pw16,
                      vertical: AppSizes.ph24,
                    ),
                    itemCount: provider.myMessageChatEntity.length,
                    itemBuilder: (context, index) {
                      final message = provider.myMessageChatEntity[index];

                      return message.userEntity == null
                          ? CustomerServiceMessageWidget(
                              sender: tr(AppStrings.customerService),
                              message: message.content!,
                              time: DateParser.dateFormatterOnlyTime(message.createdAt!),
                            )
                          : UserMessageWidget(
                              message: message.content!,
                              time: DateParser.dateFormatterOnlyTime(message.createdAt!),
                            );
                    },
                  ),
                ),
                const WriteMessageWidget()
              ],
            );
          },
        ),
      ),
    );
  }
}
