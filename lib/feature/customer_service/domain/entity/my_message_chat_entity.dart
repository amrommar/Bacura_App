import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/user_entity.dart';

class MyMessageChatEntity extends Equatable {
  final int? id;
  final int? chatId;
  final String? content;
  final int? createdBy;
  final String? createdAt;
  final String? attachment;
  final bool? isSender;
  final UserEntity? userEntity;

  const MyMessageChatEntity(
      {this.id,
      this.chatId,
      this.content,
      this.createdBy,
      this.createdAt,
      this.attachment,
      this.isSender,
      this.userEntity});

  @override
  List<Object?> get props => [id, chatId, content, createdBy, createdAt, attachment, isSender, userEntity];
}
