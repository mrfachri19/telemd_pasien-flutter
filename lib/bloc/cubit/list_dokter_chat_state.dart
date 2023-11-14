part of 'list_dokter_chat_cubit.dart';

class ListDokterChatState {
  final Result<List<ListDokterChatModel>>? listdokterchat;

  const ListDokterChatState({
    this.listdokterchat,
  });

  ListDokterChatState copyWith({
    Result<List<ListDokterChatModel>>? listdokterchat,
  }) {
    return ListDokterChatState(
      listdokterchat: listdokterchat ?? this.listdokterchat,
    );
  }
}
