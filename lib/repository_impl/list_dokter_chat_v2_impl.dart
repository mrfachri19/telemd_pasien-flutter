import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';
import 'package:telemedicine_pasien/repositories/list_dokter_chat_v2_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class ListDokterChatImplV2 implements ListDokterChatRepositoryV2 {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  ListDokterChatImplV2({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ListDokterChatModel>?>> getListDokterChatV2(
      Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getListDokterChatV2(params);
        return Right(remoteData.data);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(
        ServerFailure('Tidak ada koneksi internet'),
      );
    }
  }
}
