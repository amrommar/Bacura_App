import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.image,
    required super.sorting,
    required super.expireAt,
    super.offerId,
    required super.clickCount,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        image: json['image'],
        sorting: json['sorting'],
        expireAt: json['expires_at'],
        offerId: json['offer_id'],
        clickCount: json['click_count'],
      );
}
