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
    required super.userEntity,
  });
  factory MyMessageChatModel.fromJson(Map<String, dynamic> json) {
    return MyMessageChatModel(
      id: json['id'],
      chatId: json['chatId'],
      content: json['content'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      attachment: json['attachment'],
      isSender: json['isSender'],
      userEntity: UserModel.fromJson(json['user']),
    );
  }
}
