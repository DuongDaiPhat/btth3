import '../../domain/entities/about_me.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addAboutMe(AboutMe aboutMe) async {
    final model = AboutMeModel(id: aboutMe.id, title: aboutMe.title, description: aboutMe.description);
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
}
