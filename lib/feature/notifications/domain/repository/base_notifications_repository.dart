import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_my_notifications_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseNotificationsRepository {
  Future<Either<Failure, NotificationsEntity>> getNotifications(
      {required NotificationsParameters notificationsParameters});
}
