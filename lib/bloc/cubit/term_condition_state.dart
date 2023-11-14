part of 'term_condition_cubit.dart';

class TermConditionState {
  final Result<TermCondition>? termcondition;

  const TermConditionState({
    this.termcondition,
  });

  TermConditionState copyWith({
    Result<TermCondition>? termcondition,
  }) {
    return TermConditionState(
      termcondition: termcondition ?? this.termcondition,
    );
  }
}
