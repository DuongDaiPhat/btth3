import 'package:flutter/material.dart';
import '../../../../../core/database/database_helper.dart';
import '../../domain/entities/about_me.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/language.dart';
import '../../domain/entities/profile_item.dart';
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

  List<Language> _languageList = [];
  List<Language> get languageList => _languageList;

  List<ProfileItem> _workExperienceList = [];
  List<ProfileItem> get workExperienceList => _workExperienceList;

  List<ProfileItem> _educationList = [];
  List<ProfileItem> get educationList => _educationList;

  List<ProfileItem> _appreciationList = [];
  List<ProfileItem> get appreciationList => _appreciationList;

  Future<void> _loadData() async {
    _aboutMeList = await repository.getAboutMeList();
    _skillList = await repository.getSkills();
    _languageList = await repository.getLanguages();
    _workExperienceList = await repository.getProfileItems(DatabaseHelper.tableWorkExperience);
    _educationList = await repository.getProfileItems(DatabaseHelper.tableEducation);
    _appreciationList = await repository.getProfileItems(DatabaseHelper.tableAppreciation);
    notifyListeners();
  }

  Future<void> updateAboutMe(String description) async {
    await repository.clearAboutMe();
    await repository.addAboutMe(AboutMe(description: description));
    await _loadData();
  }

  Future<void> saveSkills(List<String> skillNames) async {
    await repository.clearSkills();
    for (var name in skillNames) {
      await repository.addSkill(Skill(name: name));
    }
    await _loadData();
  }

  Future<void> saveLanguages(List<String> languageNames) async {
    await repository.clearLanguages();
    for (var name in languageNames) {
      await repository.addLanguage(Language(name: name));
    }
    await _loadData();
  }

  Future<void> saveProfileItems(String table, List<ProfileItem> items) async {
    await repository.clearProfileItems(table);
    for (var item in items) {
      await repository.addProfileItem(table, item);
    }
    await _loadData();
  }
}
