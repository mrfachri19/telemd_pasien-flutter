part of 'list_dokter_chat_v2_cubit.dart';

class ListDokterChatStateV2 {
  final Result<List<ListDokterChatModel>>? listdokterchat;

  const ListDokterChatStateV2({
    this.listdokterchat,
  });

  ListDokterChatStateV2 copyWith({
    Result<List<ListDokterChatModel>>? listdokterchat,
  }) {
    return ListDokterChatStateV2(
      listdokterchat: listdokterchat ?? this.listdokterchat,
    );
  }
}
