import '../../domain/entities/about_me.dart';

class AboutMeModel extends AboutMe {
  AboutMeModel({super.id, required super.description});

  factory AboutMeModel.fromMap(Map<String, dynamic> map) {
    return AboutMeModel(
      id: map['id'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }
}
