import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/notifications/domain/entity/notifications_entity.dart';
import 'package:bacura_app/feature/notifications/domain/repository/base_notifications_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotificationsUseCase extends BaseUseCases<NotificationsEntity, NotificationsParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  GetNotificationsUseCase({required this.baseNotificationsRepository});

  @override
  Future<Either<Failure, NotificationsEntity>> call(NotificationsParameters parameters) async {
    return await baseNotificationsRepository.getNotifications(notificationsParameters: parameters);
  }
}

class NotificationsParameters extends Equatable {
  final int page;
  final int limit;

  // final int? serviceId;
  // final int? categoryId;

  const NotificationsParameters({
    this.page = 1,
    this.limit = 1000,
    // this.serviceId,
    // this.categoryId,
  });

  Map<String, dynamic> toMap() {
    final map = {
      "page": page,
      "limit": limit,
      // "service_id": serviceId,
      // "category_id": categoryId,
    };

    map.removeWhere((key, value) => value == null || value.toString().isEmpty);

    return map;
  }

  @override
  List<Object?> get props => [
        page, limit,
        // serviceId, categoryId,
      ];
}
