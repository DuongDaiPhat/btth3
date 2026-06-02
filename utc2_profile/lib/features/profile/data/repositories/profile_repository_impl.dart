import '../../domain/entities/about_me.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/language.dart';
import '../../domain/entities/profile_item.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';
import '../models/language_model.dart';
import '../models/profile_item_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addAboutMe(AboutMe aboutMe) async {
    final model = AboutMeModel(id: aboutMe.id, description: aboutMe.description);
    await localDataSource.addAboutMe(model);
  }

  @override
  Future<void> clearAboutMe() async {
    await localDataSource.clearAboutMe();
  }

  @override
  Future<List<AboutMe>> getAboutMeList() async {
    return await localDataSource.getAboutMeList();
  }

  @override
  Future<void> addSkill(Skill skill) async {
    final model = SkillModel(id: skill.id, name: skill.name);
    await localDataSource.addSkill(model);
  }

  @override
  Future<void> clearSkills() async {
    await localDataSource.clearSkills();
  }

  @override
  Future<List<Skill>> getSkills() async {
    return await localDataSource.getSkills();
  }

  @override
  Future<void> addLanguage(Language language) async {
    final model = LanguageModel(id: language.id, name: language.name);
    await localDataSource.addLanguage(model);
  }

  @override
  Future<void> clearLanguages() async {
    await localDataSource.clearLanguages();
  }

  @override
  Future<List<Language>> getLanguages() async {
    return await localDataSource.getLanguages();
  }

  @override
  Future<void> addProfileItem(String table, ProfileItem item) async {
    final model = ProfileItemModel(id: item.id, title: item.title, description: item.description);
    await localDataSource.addProfileItem(table, model);
  }

  @override
  Future<void> clearProfileItems(String table) async {
    await localDataSource.clearProfileItems(table);
  }

  @override
  Future<List<ProfileItem>> getProfileItems(String table) async {
    return await localDataSource.getProfileItems(table);
  }
}
