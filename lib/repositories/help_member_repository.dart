import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/help_member_model.dart';

abstract class HelpMemberRepository {
  Future<Either<Failure, HelpMemberModel?>> getHelpMember();
}
