import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/schedule_dokter_model.dart';

abstract class ScheduleDokterRepository {
  Future<Either<Failure, List<ScheduleDokterModel>?>> getScheduleDokter(
      final int id, Map<String, dynamic> params);
}
