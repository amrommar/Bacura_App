import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/core/services/usecases.dart';
import 'package:bacura_app/feature/notifications/domain/repository/base_notifications_repository.dart';
import 'package:dartz/dartz.dart';

class GetUnreadNotificationsUseCase extends BaseUseCasesNoParam<int> {
  BaseNotificationsRepository baseNotificationsRepository;
  GetUnreadNotificationsUseCase({required this.baseNotificationsRepository});
  @override
  Future<Either<Failure, int>> call() {
    return baseNotificationsRepository.unreadNotification();
  }
}
