part of 'kategori_spesialis_cubit.dart';

class KategoriSpesialisState {
  final Result<List<KategoriSpesialisModel>>? kategorispesialis;

  const KategoriSpesialisState({
    this.kategorispesialis,
  });

  KategoriSpesialisState copyWith({
    Result<List<KategoriSpesialisModel>>? kategorispesialis,
  }) {
    return KategoriSpesialisState(
      kategorispesialis: kategorispesialis ?? this.kategorispesialis,
    );
  }
}
