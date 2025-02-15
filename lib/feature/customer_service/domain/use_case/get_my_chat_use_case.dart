import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/repository/base_chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyChatUseCase extends BaseUseCasesNoParam<ChatEntity> {
  final BaseChatRepository baseChatRepository;

  GetMyChatUseCase({required this.baseChatRepository});

  @override
  Future<Either<Failure, ChatEntity>> call() {
    return baseChatRepository.getMyChats();
  }
}
