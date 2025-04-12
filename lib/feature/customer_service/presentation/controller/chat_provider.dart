import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/my_message_chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/use_case/get_message_chat_use_case.dart';
import 'package:bacura_app/feature/customer_service/domain/use_case/get_my_chat_use_case.dart';
import 'package:bacura_app/feature/customer_service/domain/use_case/send_message_use_case.dart';

class ChatProvider with ChangeNotifier {
  List<MyMessageChatEntity> myMessageChatEntity = [];
  ChatEntity? getMessagesChat;
  bool isLoading = true;
  String content = '';
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  ChatProvider() {
    init();
  }

  init() async {
    await _getMine();
    await _getChatMessages();
    scrollToBottom();
  }

  Future<void> _getMine() async {
    var result = await sl<GetMyChatUseCase>().call();
    result.fold((l) async {}, (r) async {
      getMessagesChat = r;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> _getChatMessages() async {
    var result = await sl<GetMessageChatUseCase>().call(getMessagesChat!.id);
    result.fold((l) async {}, (r) async {
      myMessageChatEntity = r;
      isLoading = false;
      notifyListeners();
      scrollToBottom();
    });
  }

  Future<void> sendMessage({required String content}) async {
    var result = await sl<SendMessageUseCase>().call(
      SendMessageParams(id: getMessagesChat!.id, content: content),
    );
    result.fold((l) async {}, (r) async {
      await _getChatMessages();
      messageController.clear();
      notifyListeners();
      scrollToBottom();
    });
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String dateCreateOrder(int index) {
    MyMessageChatEntity requestEntity = myMessageChatEntity[index];
    String fullDateTime = requestEntity.createdAt!;
    String dateOnly = fullDateTime.split("T")[0];
    return dateOnly;
  }
}
