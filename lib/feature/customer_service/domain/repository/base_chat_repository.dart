import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChatRepository {
  Future<Either<Failure, ChatEntity>> getMyChats();
  // Future<Either<Failure, ChatsEntity>> sendMessage({required String message});
}
