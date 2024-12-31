import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel {
  String? id;
  String? name;
  Timestamp? createdAt;
  int? itemsNumber;

  FolderModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.itemsNumber,
  });

  FolderModel.fromDocumentSnapshot(QueryDocumentSnapshot<Object?> doc) {
    id = doc.id;
    name = doc['name'];
    createdAt = doc['time'];
  }
}
