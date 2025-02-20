import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/customer_service/data/data_source/chat_data_source.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/my_message_chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/repository/base_chat_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRepository extends BaseChatRepository {
  BaseChatDataSource baseChatsDataSource;

  ChatRepository({required this.baseChatsDataSource});
  @override
  Future<Either<Failure, ChatEntity>> getMyChats() async {
    try {
      return Right(await baseChatsDataSource.getMyChats());
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }

  @override
  Future<Either<Failure, MyMessageChatEntity>> getMessagesChat({required int id}) {
    // TODO: implement getMessagesChat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> sendMessage({required String content, required int id}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
