part of 'faq_cubit.dart';

class FaqState {
  final Result<KebijakanPrivasi>? kebijakanprivasi;

  const FaqState({
    this.kebijakanprivasi,
  });

  FaqState copyWith({
    Result<KebijakanPrivasi>? kebijakanprivasi,
  }) {
    return FaqState(
      kebijakanprivasi: kebijakanprivasi ?? this.kebijakanprivasi,
    );
  }
}
