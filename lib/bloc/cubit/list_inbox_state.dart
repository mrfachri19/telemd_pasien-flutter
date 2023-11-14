part of 'list_inbox_cubit.dart';

class ListInboxState {
  final Result<List<ListInboxModel>>? listinbox;

  const ListInboxState({
    this.listinbox,
  });

  ListInboxState copyWith({
    Result<List<ListInboxModel>>? listinbox,
  }) {
    return ListInboxState(
      listinbox: listinbox ?? this.listinbox,
    );
  }
}
