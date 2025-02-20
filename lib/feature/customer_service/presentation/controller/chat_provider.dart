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

  ChatProvider() {
    init();
  }

  init() async {
    await _getMine();
    await _getChatMessages();
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
    });
  }

  Future<void> sendMessage() async {
    var result = await sl<SendMessageUseCase>().call(SendMessageParams(id: getMessagesChat!.id, content: content));
    result.fold((l) async {}, (r) async {
      notifyListeners();
    });
  }
}
