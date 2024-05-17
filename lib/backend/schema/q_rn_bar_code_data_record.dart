import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QRnBarCodeDataRecord extends FirestoreRecord {
  QRnBarCodeDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "TrackingNumber" field.
  String? _trackingNumber;
  String get trackingNumber => _trackingNumber ?? '';
  bool hasTrackingNumber() => _trackingNumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['Type'] as String?;
    _value = snapshotData['Value'] as String?;
    _trackingNumber = snapshotData['TrackingNumber'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QRnBarCodeData');

  static Stream<QRnBarCodeDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QRnBarCodeDataRecord.fromSnapshot(s));

  static Future<QRnBarCodeDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QRnBarCodeDataRecord.fromSnapshot(s));

  static QRnBarCodeDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QRnBarCodeDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QRnBarCodeDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QRnBarCodeDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QRnBarCodeDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QRnBarCodeDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQRnBarCodeDataRecordData({
  String? name,
  String? type,
  String? value,
  String? trackingNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Type': type,
      'Value': value,
      'TrackingNumber': trackingNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class QRnBarCodeDataRecordDocumentEquality
    implements Equality<QRnBarCodeDataRecord> {
  const QRnBarCodeDataRecordDocumentEquality();

  @override
  bool equals(QRnBarCodeDataRecord? e1, QRnBarCodeDataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.value == e2?.value &&
        e1?.trackingNumber == e2?.trackingNumber;
  }

  @override
  int hash(QRnBarCodeDataRecord? e) => const ListEquality()
      .hash([e?.name, e?.type, e?.value, e?.trackingNumber]);

  @override
  bool isValidKey(Object? o) => o is QRnBarCodeDataRecord;
}
