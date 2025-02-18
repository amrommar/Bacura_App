import 'package:bacura_app/core/utils/index.dart';

class ItemsForOrderEntity extends Equatable {
  final int? id;

  final String? name;
  final int? price;
  final int? quantity;
  final String? image;

  const ItemsForOrderEntity({this.name, this.id, this.price, this.quantity, this.image});

  @override
  List<Object?> get props => [name, id, price, quantity, image];
}
