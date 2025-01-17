import 'package:equatable/equatable.dart';

class LastApiErrorRecorded extends Equatable {
  final String message;
  final DateTime time;

  const LastApiErrorRecorded({
    required this.time,
    required this.message,
  });

  @override
  List<Object?> get props => [
        time,
        message,
      ];
}
