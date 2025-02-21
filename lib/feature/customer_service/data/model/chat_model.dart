import 'package:bacura_app/feature/customer_service/data/model/user_model.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required super.supportNewMessageCount,
    required super.userEntity,
    // required super.messages,
    required super.userNewMessageCount,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      supportNewMessageCount: json['support_new_message_count'],
      userEntity: UserModel.fromJson(json['user']),
      // messages: (json['messages'] as List<dynamic>?)?.map((e) => MessageModel.fromJson(e)).toList() ?? [],
      userNewMessageCount: json['user_new_message_count'],
    );
  }
}
