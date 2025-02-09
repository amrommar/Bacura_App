import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/notifications/data/data_source/notifications_data_source.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/repository/base_notifications_repository.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_my_notifications_use_case.dart';
import 'package:dartz/dartz.dart';

class NotificationsRepository extends BaseNotificationsRepository {
  BaseNotificationsDataSource baseNotificationsDataSource;

  NotificationsRepository({required this.baseNotificationsDataSource});

  @override
  Future<Either<Failure, NotificationsEntity>> getNotifications(
      {required NotificationsParameters notificationsParameters}) async {
    try {
      return Right(
          await baseNotificationsDataSource.getNotifications(notificationsParameters: notificationsParameters));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
