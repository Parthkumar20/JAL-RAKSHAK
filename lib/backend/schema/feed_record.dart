import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedRecord extends FirestoreRecord {
  FeedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "PostImage" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  // "PostUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "postUserImage" field.
  String? _postUserImage;
  String get postUserImage => _postUserImage ?? '';
  bool hasPostUserImage() => _postUserImage != null;

  // "postUserName" field.
  String? _postUserName;
  String get postUserName => _postUserName ?? '';
  bool hasPostUserName() => _postUserName != null;

  // "userLikes" field.
  List<DocumentReference>? _userLikes;
  List<DocumentReference> get userLikes => _userLikes ?? const [];
  bool hasUserLikes() => _userLikes != null;

  // "userBookmark" field.
  List<DocumentReference>? _userBookmark;
  List<DocumentReference> get userBookmark => _userBookmark ?? const [];
  bool hasUserBookmark() => _userBookmark != null;

  // "createdtime" field.
  DateTime? _createdtime;
  DateTime? get createdtime => _createdtime;
  bool hasCreatedtime() => _createdtime != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  void _initializeFields() {
    _postImage = snapshotData['PostImage'] as String?;
    _postUser = snapshotData['PostUser'] as DocumentReference?;
    _username = snapshotData['username'] as String?;
    _postUserImage = snapshotData['postUserImage'] as String?;
    _postUserName = snapshotData['postUserName'] as String?;
    _userLikes = getDataList(snapshotData['userLikes']);
    _userBookmark = getDataList(snapshotData['userBookmark']);
    _createdtime = snapshotData['createdtime'] as DateTime?;
    _postText = snapshotData['postText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feed');

  static Stream<FeedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedRecord.fromSnapshot(s));

  static Future<FeedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedRecord.fromSnapshot(s));

  static FeedRecord fromSnapshot(DocumentSnapshot snapshot) => FeedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedRecordData({
  String? postImage,
  DocumentReference? postUser,
  String? username,
  String? postUserImage,
  String? postUserName,
  DateTime? createdtime,
  String? postText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PostImage': postImage,
      'PostUser': postUser,
      'username': username,
      'postUserImage': postUserImage,
      'postUserName': postUserName,
      'createdtime': createdtime,
      'postText': postText,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedRecordDocumentEquality implements Equality<FeedRecord> {
  const FeedRecordDocumentEquality();

  @override
  bool equals(FeedRecord? e1, FeedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postImage == e2?.postImage &&
        e1?.postUser == e2?.postUser &&
        e1?.username == e2?.username &&
        e1?.postUserImage == e2?.postUserImage &&
        e1?.postUserName == e2?.postUserName &&
        listEquality.equals(e1?.userLikes, e2?.userLikes) &&
        listEquality.equals(e1?.userBookmark, e2?.userBookmark) &&
        e1?.createdtime == e2?.createdtime &&
        e1?.postText == e2?.postText;
  }

  @override
  int hash(FeedRecord? e) => const ListEquality().hash([
        e?.postImage,
        e?.postUser,
        e?.username,
        e?.postUserImage,
        e?.postUserName,
        e?.userLikes,
        e?.userBookmark,
        e?.createdtime,
        e?.postText
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedRecord;
}
