import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/my_message_chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/repository/base_chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetMessageChatUseCase extends BaseUseCases<MyMessageChatEntity, int> {
  BaseChatRepository baseChatRepository;
  GetMessageChatUseCase({required this.baseChatRepository});
  @override
  Future<Either<Failure, MyMessageChatEntity>> call(parameters) {
    return baseChatRepository.getMessagesChat(id: parameters);
  }
}
