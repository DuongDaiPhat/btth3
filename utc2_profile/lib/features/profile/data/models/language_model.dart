import '../../domain/entities/language.dart';

class LanguageModel extends Language {
  LanguageModel({super.id, required super.name});

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      id: map['id'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
