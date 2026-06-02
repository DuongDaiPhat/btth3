import '../../domain/entities/profile_item.dart';

class ProfileItemModel extends ProfileItem {
  ProfileItemModel({super.id, required super.title, required super.description});

  factory ProfileItemModel.fromMap(Map<String, dynamic> map) {
    return ProfileItemModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
