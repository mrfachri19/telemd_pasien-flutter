import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/promo_banner_model.dart';

abstract class PromoBannerRepository {
  Future<Either<Failure, List<PromoBannerModel>?>> getPromoBanner();
}
