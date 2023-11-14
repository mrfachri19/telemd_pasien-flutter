import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';

abstract class ListDokterChatRepository {
  Future<Either<Failure, List<ListDokterChatModel>?>> getListDokterChat();
}
