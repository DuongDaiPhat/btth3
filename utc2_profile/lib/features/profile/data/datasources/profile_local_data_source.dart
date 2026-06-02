import '../../../../core/database/database_helper.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<AboutMeModel>> getAboutMeList();
  Future<void> addAboutMe(AboutMeModel aboutMe);
  Future<void> clearAboutMe();
  Future<List<SkillModel>> getSkills();
  Future<void> addSkill(SkillModel skill);
  Future<void> clearSkills();
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
}
