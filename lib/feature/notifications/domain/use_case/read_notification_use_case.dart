import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/repository/base_notifications_repository.dart';
import 'package:dartz/dartz.dart';

class ReadNotificationUseCase extends BaseUseCases<void, int> {
  final BaseNotificationsRepository baseNotificationsRepository;

  ReadNotificationUseCase({required this.baseNotificationsRepository});

  @override
  Future<Either<Failure, void>> call(int parameters) {
    return baseNotificationsRepository.readNotification(notificationId: parameters);
  }
}
