import 'package:bacura_app/feature/customer_service/data/model/user_model.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/my_message_chat_entity.dart';

class MyMessageChatModel extends MyMessageChatEntity {
  const MyMessageChatModel({
    required super.id,
    required super.chatId,
    required super.content,
    required super.createdBy,
    required super.createdAt,
    required super.attachment,
    required super.isSender,
    super.userEntity,
  });
  factory MyMessageChatModel.fromJson(Map<String, dynamic> json) {
    return MyMessageChatModel(
      id: json['id'],
      chatId: json['chat_id'],
      content: json['content'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      attachment: json['attachment'],
      isSender: json['is_sender'],
      userEntity: json['user'] == null ? null : UserModel.fromJson(json['user']),
    );
  }
}
