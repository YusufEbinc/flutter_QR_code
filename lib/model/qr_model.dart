import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'qr_model.g.dart';

@HiveType(typeId: 1)
class QrModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime? time;

  @HiveField(2)
  final String? barcode;

  QrModel({required this.id, this.barcode, this.time});

  factory QrModel.fromMap(
          {required String barcode, required DateTime dateTime}) =>
      QrModel(
        id: const Uuid().v1(),
        barcode: barcode,
        time: dateTime,
      );
}
