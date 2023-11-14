import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/term_condition.dart';

abstract class TermConditionRepository {
  Future<Either<Failure, TermCondition?>> getTermCondition();
}
