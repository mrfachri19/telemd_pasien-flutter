import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/login.dart';

abstract class LoginEmailRepository {
  Future<Either<Failure, Login>> login([Map<String, dynamic>? params]);
}
