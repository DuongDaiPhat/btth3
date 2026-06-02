import '../../../../core/database/database_helper.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';
import '../models/language_model.dart';
import '../models/profile_item_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<AboutMeModel>> getAboutMeList();
  Future<void> addAboutMe(AboutMeModel aboutMe);
  Future<void> clearAboutMe();
  Future<List<SkillModel>> getSkills();
  Future<void> addSkill(SkillModel skill);
  Future<void> clearSkills();
  Future<List<LanguageModel>> getLanguages();
  Future<void> addLanguage(LanguageModel language);
  Future<void> clearLanguages();
  Future<List<ProfileItemModel>> getProfileItems(String table);
  Future<void> addProfileItem(String table, ProfileItemModel item);
  Future<void> clearProfileItems(String table);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final DatabaseHelper databaseHelper;

  ProfileLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> addAboutMe(AboutMeModel aboutMe) async {
    final db = await databaseHelper.database;
    await db.insert(DatabaseHelper.tableAboutMe, aboutMe.toMap());
  }

  @override
  Future<void> clearAboutMe() async {
    final db = await databaseHelper.database;
    await db.delete(DatabaseHelper.tableAboutMe);
  }

  @override
  Future<List<AboutMeModel>> getAboutMeList() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.tableAboutMe);
    return List.generate(maps.length, (i) {
      return AboutMeModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> addSkill(SkillModel skill) async {
    final db = await databaseHelper.database;
    await db.insert(DatabaseHelper.tableSkill, skill.toMap());
  }

  @override
  Future<void> clearSkills() async {
    final db = await databaseHelper.database;
    await db.delete(DatabaseHelper.tableSkill);
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.tableSkill);
    return List.generate(maps.length, (i) {
      return SkillModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> addLanguage(LanguageModel language) async {
    final db = await databaseHelper.database;
    await db.insert(DatabaseHelper.tableLanguage, language.toMap());
  }

  @override
  Future<void> clearLanguages() async {
    final db = await databaseHelper.database;
    await db.delete(DatabaseHelper.tableLanguage);
  }

  @override
  Future<List<LanguageModel>> getLanguages() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.tableLanguage);
    return List.generate(maps.length, (i) {
      return LanguageModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> addProfileItem(String table, ProfileItemModel item) async {
    final db = await databaseHelper.database;
    await db.insert(table, item.toMap());
  }

  @override
  Future<void> clearProfileItems(String table) async {
    final db = await databaseHelper.database;
    await db.delete(table);
  }

  @override
  Future<List<ProfileItemModel>> getProfileItems(String table) async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return ProfileItemModel.fromMap(maps[i]);
    });
  }
}
