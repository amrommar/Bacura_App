import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/feature/customer_service/data/model/chat_model.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';

abstract class BaseChatDataSource {
  Future<ChatEntity> getMyChats();
}

class ChatsDataSource extends BaseChatDataSource {
  @override
  Future<ChatEntity> getMyChats() async {
    var response = await ApiClient().apiCall(requestType: RequestType.GET, url: ApiEndPoint.chats);
    return APIResponse<ChatEntity>.fromJson(response?.data, (data) {
      return ChatModel.fromJson(data);
    }).data!;
  }
}
