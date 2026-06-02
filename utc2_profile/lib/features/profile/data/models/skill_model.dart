import '../../domain/entities/skill.dart';

class SkillModel extends Skill {
  SkillModel({super.id, required super.name});

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
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
