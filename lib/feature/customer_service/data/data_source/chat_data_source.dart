import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/feature/customer_service/data/model/chat_model.dart';
import 'package:bacura_app/feature/customer_service/data/model/my_message_chat_model.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/my_message_chat_entity.dart';

abstract class BaseChatDataSource {
  Future<ChatEntity> getMyChats();
  Future<MyMessageChatEntity> getMessagesChat({required int id});
  Future<void> sendMessage({required String content, required int id});
}

class ChatsDataSource extends BaseChatDataSource {
  @override
  Future<ChatEntity> getMyChats() async {
    var response = await ApiClient().apiCall(requestType: RequestType.GET, url: ApiEndPoint.chats);
    return APIResponse<ChatEntity>.fromJson(response?.data, (data) {
      return ChatModel.fromJson(data);
    }).data!;
  }

  @override
  Future<MyMessageChatEntity> getMessagesChat({required int id}) async {
    var response = await ApiClient().apiCall(requestType: RequestType.GET, url: 'chats/$id/messages');
    return APIResponse<MyMessageChatEntity>.fromJson(response?.data, (data) {
      return MyMessageChatModel.fromJson(data);
    }).data!;
  }

  @override
  Future<void> sendMessage({required String content, required int id}) async {
    await ApiClient().apiCall(requestType: RequestType.POST, url: 'chats/$id/messages', body: content);
  }
}
