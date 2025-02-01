import 'package:equatable/equatable.dart';

class Paging extends Equatable {
  final int page;
  final int limit;

  const Paging({this.page = 1, this.limit = 1000});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
      };

  @override
  List<Object?> get props => [page, limit];
}
