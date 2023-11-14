part of 'kebijakan_privasi_cubit.dart';

class KebijakanPrivasiState {
  final Result<KebijakanPrivasi>? kebijakanprivasi;

  const KebijakanPrivasiState({
    this.kebijakanprivasi,
  });

  KebijakanPrivasiState copyWith({
    Result<KebijakanPrivasi>? kebijakanprivasi,
  }) {
    return KebijakanPrivasiState(
      kebijakanprivasi: kebijakanprivasi ?? this.kebijakanprivasi,
    );
  }
}
