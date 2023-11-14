import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/model/help_member_model.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/repositories/help_member_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class HelpMemberImpl implements HelpMemberRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  HelpMemberImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, HelpMemberModel?>> getHelpMember() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getHelpMember();
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
