part of 'artikel_cubit.dart';

class ArtikelState {
  final Result<List<ArtikelModel>>? artikel;

  const ArtikelState({
    this.artikel,
  });

  ArtikelState copyWith({
    Result<List<ArtikelModel>>? artikel,
  }) {
    return ArtikelState(
      artikel: artikel ?? this.artikel,
    );
  }
}
