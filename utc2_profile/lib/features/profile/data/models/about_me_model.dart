import '../../domain/entities/about_me.dart';

class AboutMeModel extends AboutMe {
  AboutMeModel({super.id, required super.title, required super.description});

  factory AboutMeModel.fromMap(Map<String, dynamic> map) {
    return AboutMeModel(
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
