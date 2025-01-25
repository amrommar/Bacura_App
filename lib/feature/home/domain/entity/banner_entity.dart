import 'package:bacura_app/core/utils/index.dart';

class BannerEntity extends Equatable {
  final int id;
  final String image;
  final int sorting;
  final String expireAt;
  final int? offerId;
  final int clickCount;

  const BannerEntity({
    required this.id,
    required this.image,
    required this.sorting,
    required this.expireAt,
    this.offerId,
    required this.clickCount,
  });
  @override
  List<Object?> get props => [
        id,
        image,
        sorting,
        expireAt,
        offerId,
        clickCount,
      ];
}
