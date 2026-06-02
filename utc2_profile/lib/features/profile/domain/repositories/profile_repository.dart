import '../entities/about_me.dart';
import '../entities/skill.dart';
import '../entities/language.dart';
import '../entities/profile_item.dart';

abstract class ProfileRepository {
  Future<List<AboutMe>> getAboutMeList();
  Future<void> addAboutMe(AboutMe aboutMe);
  Future<void> clearAboutMe();
  
  Future<List<Skill>> getSkills();
  Future<void> addSkill(Skill skill);
  Future<void> clearSkills();

  Future<List<Language>> getLanguages();
  Future<void> addLanguage(Language language);
  Future<void> clearLanguages();

  Future<List<ProfileItem>> getProfileItems(String table);
  Future<void> addProfileItem(String table, ProfileItem item);
  Future<void> clearProfileItems(String table);
}
