import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "SenderID" field.
  List<DocumentReference>? _senderID;
  List<DocumentReference> get senderID => _senderID ?? const [];
  bool hasSenderID() => _senderID != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "senderImage" field.
  String? _senderImage;
  String get senderImage => _senderImage ?? '';
  bool hasSenderImage() => _senderImage != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderID = getDataList(snapshotData['SenderID']);
    _senderName = snapshotData['senderName'] as String?;
    _senderImage = snapshotData['senderImage'] as String?;
    _messageText = snapshotData['messageText'] as String?;
    _messageImage = snapshotData['messageImage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('message').doc(id);

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? senderName,
  String? senderImage,
  String? messageText,
  String? messageImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderName': senderName,
      'senderImage': senderImage,
      'messageText': messageText,
      'messageImage': messageImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.senderID, e2?.senderID) &&
        e1?.senderName == e2?.senderName &&
        e1?.senderImage == e2?.senderImage &&
        e1?.messageText == e2?.messageText &&
        e1?.messageImage == e2?.messageImage;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.senderID,
        e?.senderName,
        e?.senderImage,
        e?.messageText,
        e?.messageImage
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
