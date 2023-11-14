import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/list_inbox_model.dart';

abstract class ListInboxRepository {
  Future<Either<Failure, List<ListInboxModel>?>> getListInbox();
}
