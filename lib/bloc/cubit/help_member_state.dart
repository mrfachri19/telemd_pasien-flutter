part of 'help_member_cubit.dart';

class HelpMemberState {
  final Result<HelpMemberModel>? helpmember;

  const HelpMemberState({
    this.helpmember,
  });

  HelpMemberState copyWith({
    Result<HelpMemberModel>? helpmember,
  }) {
    return HelpMemberState(
      helpmember: helpmember ?? this.helpmember,
    );
  }
}
