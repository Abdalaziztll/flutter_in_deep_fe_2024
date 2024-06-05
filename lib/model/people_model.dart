// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PeopleModel {
  String name;
  String image;
  String message;
  String date;
  String id;
  num unread_message_count;
  PeopleModel({
    required this.name,
    required this.image,
    required this.message,
    required this.date,
    required this.id,
    required this.unread_message_count,
  });

  PeopleModel copyWith({
    String? name,
    String? image,
    String? message,
    String? date,
    String? id,
    num? unread_message_count,
  }) {
    return PeopleModel(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      date: date ?? this.date,
      id: id ?? this.id,
      unread_message_count: unread_message_count ?? this.unread_message_count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'message': message,
      'date': date,
      'id': id,
      'unread_message_count': unread_message_count,
    };
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      name: map['name'] as String,
      image: map['image'] as String,
      message: map['message'] as String,
      date: map['date'] as String,
      id: map['id'] as String,
      unread_message_count: map['unread_message_count'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(String source) => PeopleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeopleModel(name: $name, image: $image, message: $message, date: $date, id: $id, unread_message_count: $unread_message_count)';
  }

  @override
  bool operator ==(covariant PeopleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.message == message &&
      other.date == date &&
      other.id == id &&
      other.unread_message_count == unread_message_count;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      message.hashCode ^
      date.hashCode ^
      id.hashCode ^
      unread_message_count.hashCode;
  }
}
