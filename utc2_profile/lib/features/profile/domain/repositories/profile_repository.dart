import '../entities/about_me.dart';
import '../entities/skill.dart';

abstract class ProfileRepository {
  Future<List<AboutMe>> getAboutMeList();
  Future<void> addAboutMe(AboutMe aboutMe);
  Future<void> clearAboutMe();
  
  Future<List<Skill>> getSkills();
  Future<void> addSkill(Skill skill);
  Future<void> clearSkills();
}
