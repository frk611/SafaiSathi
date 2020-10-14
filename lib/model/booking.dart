import 'package:cloud_firestore/cloud_firestore.dart';

class Bookings {
  String id;
  String type;
  String name;
  String location;
  String image;
  String phNumber;
  List trash = [];
  Timestamp createdAt;
  Timestamp updatedAt;

  Bookings();

  Bookings.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    type = data['type'];
    name = data['name'];
    location = data['location'];
    image = data['image'];
    phNumber = data['phNumber'];
    trash = data['trash'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'location': location,
      'image': image,
      'phNumber': phNumber,
      'trash': trash,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
