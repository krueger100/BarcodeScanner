import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedPhotosRecord extends FirestoreRecord {
  UploadedPhotosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uploadedPhotos');

  static Stream<UploadedPhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UploadedPhotosRecord.fromSnapshot(s));

  static Future<UploadedPhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UploadedPhotosRecord.fromSnapshot(s));

  static UploadedPhotosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UploadedPhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UploadedPhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UploadedPhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UploadedPhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UploadedPhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUploadedPhotosRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class UploadedPhotosRecordDocumentEquality
    implements Equality<UploadedPhotosRecord> {
  const UploadedPhotosRecordDocumentEquality();

  @override
  bool equals(UploadedPhotosRecord? e1, UploadedPhotosRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(UploadedPhotosRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is UploadedPhotosRecord;
}
