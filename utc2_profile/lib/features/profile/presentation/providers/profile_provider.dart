import 'package:flutter/material.dart';
import '../../domain/entities/about_me.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepository repository;

  ProfileProvider({required this.repository}) {
    _loadData();
  }

  List<AboutMe> _aboutMeList = [];
  List<AboutMe> get aboutMeList => _aboutMeList;

  List<Skill> _skillList = [];
  List<Skill> get skillList => _skillList;

  Future<void> _loadData() async {
    _aboutMeList = await repository.getAboutMeList();
    _skillList = await repository.getSkills();
    notifyListeners();
  }

  Future<void> updateAboutMe(String title, String description) async {
    await repository.clearAboutMe();
    await repository.addAboutMe(AboutMe(title: title, description: description));
    await _loadData();
  }

  Future<void> saveSkills(List<String> skillNames) async {
    await repository.clearSkills();
    for (var name in skillNames) {
      await repository.addSkill(Skill(name: name));
    }
    await _loadData();
  }
}
