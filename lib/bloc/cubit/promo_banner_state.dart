part of 'promo_banner_cubit.dart';

class PromoBannerState {
  final Result<List<PromoBannerModel>>? promobanner;

  const PromoBannerState({
    this.promobanner,
  });

  PromoBannerState copyWith({
    Result<List<PromoBannerModel>>? promobanner,
  }) {
    return PromoBannerState(
      promobanner: promobanner ?? this.promobanner,
    );
  }
}
