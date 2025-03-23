import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "participantsimage" field.
  List<String>? _participantsimage;
  List<String> get participantsimage => _participantsimage ?? const [];
  bool hasParticipantsimage() => _participantsimage != null;

  // "participantsName" field.
  List<String>? _participantsName;
  List<String> get participantsName => _participantsName ?? const [];
  bool hasParticipantsName() => _participantsName != null;

  // "participantsId" field.
  List<DocumentReference>? _participantsId;
  List<DocumentReference> get participantsId => _participantsId ?? const [];
  bool hasParticipantsId() => _participantsId != null;

  // "lastmessage" field.
  String? _lastmessage;
  String get lastmessage => _lastmessage ?? '';
  bool hasLastmessage() => _lastmessage != null;

  // "lastMessageTS" field.
  DateTime? _lastMessageTS;
  DateTime? get lastMessageTS => _lastMessageTS;
  bool hasLastMessageTS() => _lastMessageTS != null;

  void _initializeFields() {
    _participantsimage = getDataList(snapshotData['participantsimage']);
    _participantsName = getDataList(snapshotData['participantsName']);
    _participantsId = getDataList(snapshotData['participantsId']);
    _lastmessage = snapshotData['lastmessage'] as String?;
    _lastMessageTS = snapshotData['lastMessageTS'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? lastmessage,
  DateTime? lastMessageTS,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastmessage': lastmessage,
      'lastMessageTS': lastMessageTS,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.participantsimage, e2?.participantsimage) &&
        listEquality.equals(e1?.participantsName, e2?.participantsName) &&
        listEquality.equals(e1?.participantsId, e2?.participantsId) &&
        e1?.lastmessage == e2?.lastmessage &&
        e1?.lastMessageTS == e2?.lastMessageTS;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.participantsimage,
        e?.participantsName,
        e?.participantsId,
        e?.lastmessage,
        e?.lastMessageTS
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
