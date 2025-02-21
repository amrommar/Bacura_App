import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/repository/base_chat_repository.dart';
import 'package:dartz/dartz.dart';

class SendMessageUseCase extends BaseUseCases<void, SendMessageParams> {
  final BaseChatRepository baseChatRepository;

  SendMessageUseCase({required this.baseChatRepository});

  @override
  Future<Either<Failure, void>> call(SendMessageParams parameters) {
    return baseChatRepository.sendMessage(
      id: parameters.id,
      content: parameters.content,
    );
  }
}

class SendMessageParams {
  final int id;
  final String content;

  const SendMessageParams({required this.id, required this.content});
  Map<String, dynamic> toJson() => {'content': content};
}
