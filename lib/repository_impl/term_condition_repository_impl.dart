import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/model/term_condition.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/repositories/term_condition_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class TermConditionImpl implements TermConditionRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  TermConditionImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, TermCondition?>> getTermCondition() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getTermCondition();
        return Right(remoteData.data[0]);
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
