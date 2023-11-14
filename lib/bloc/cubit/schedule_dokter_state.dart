part of 'schedule_dokter_cubit.dart';

class ScheduleDokterState {
  final Result<List<ScheduleDokterModel>>? scheduledokter;

  const ScheduleDokterState({
    this.scheduledokter,
  });

  ScheduleDokterState copyWith({
    Result<List<ScheduleDokterModel>>? scheduledokter,
  }) {
    return ScheduleDokterState(
      scheduledokter: scheduledokter ?? this.scheduledokter,
    );
  }
}
