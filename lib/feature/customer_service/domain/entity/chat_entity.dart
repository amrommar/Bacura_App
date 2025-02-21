import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/user_entity.dart';

class ChatEntity extends Equatable {
  final int id;
  final int? supportNewMessageCount;
  final int? userNewMessageCount;
  final UserEntity? userEntity;
  // final List<String>? messages;

  const ChatEntity({required this.id, this.supportNewMessageCount, this.userNewMessageCount, this.userEntity});

  @override
  List<Object?> get props => [id, supportNewMessageCount, userNewMessageCount, userEntity];
}
