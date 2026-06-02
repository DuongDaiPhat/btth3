import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../providers/profile_provider.dart';
import '../widgets/about_me_dialog.dart';
import '../widgets/skill_dialog.dart';
import '../widgets/language_dialog.dart';
import '../widgets/profile_item_dialog.dart';
import '../../../../core/database/database_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar / Logo
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(51),
                    child: Image.asset(
                      'asset/image/utc2_logo.png',
                      width: 102,
                      height: 102,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // User Name
                const Text(
                  'Dương Đại Phát',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                // Email
                const Text(
                  '6451071058@st.utc2.edu.vn',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Cards
                _buildSectionCard(
                  title: 'About Me',
                  iconPath: 'asset/icons/Icon About me.svg',
                  isEmpty: provider.aboutMeList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const AboutMeDialog(),
                    );
                  },
                  dataContent: provider.aboutMeList.isEmpty
                      ? null
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: provider.aboutMeList
                              .map(
                                (aboutMe) => Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    aboutMe.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
                _buildSectionCard(
                  title: 'Work experience',
                  iconPath: 'asset/icons/Icon Work experience.svg',
                  isEmpty: provider.workExperienceList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => ProfileItemDialog(
                        title: 'Work Experience',
                        tableName: DatabaseHelper.tableWorkExperience,
                        initialItems: provider.workExperienceList,
                      ),
                    );
                  },
                  dataContent: provider.workExperienceList.isEmpty
                      ? null
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: provider.workExperienceList
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.description,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
                _buildSectionCard(
                  title: 'Education',
                  iconPath: 'asset/icons/Icon Education.svg',
                  isEmpty: provider.educationList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => ProfileItemDialog(
                        title: 'Education',
                        tableName: DatabaseHelper.tableEducation,
                        initialItems: provider.educationList,
                      ),
                    );
                  },
                  dataContent: provider.educationList.isEmpty
                      ? null
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: provider.educationList
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.description,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
                _buildSectionCard(
                  title: 'Skill',
                  iconPath: 'asset/icons/Icon Skill.svg',
                  isEmpty: provider.skillList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const SkillDialog(),
                    );
                  },
                  dataContent: provider.skillList.isEmpty
                      ? null
                      : Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: provider.skillList
                                .map(
                                  (skill) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.itemColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.iconColor.withValues(
                                          alpha: 0.1,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      skill.name,
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                ),
                _buildSectionCard(
                  title: 'Language',
                  iconPath: 'asset/icons/Icon Language.svg',
                  isEmpty: provider.languageList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const LanguageDialog(),
                    );
                  },
                  dataContent: provider.languageList.isEmpty
                      ? null
                      : Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: provider.languageList
                                .map(
                                  (language) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.itemColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.iconColor.withValues(
                                          alpha: 0.1,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      language.name,
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                ),
                _buildSectionCard(
                  title: 'Appreciation',
                  iconPath: 'asset/icons/Icon Appreciation.svg',
                  isEmpty: provider.appreciationList.isEmpty,
                  onActionPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => ProfileItemDialog(
                        title: 'Appreciation',
                        tableName: DatabaseHelper.tableAppreciation,
                        initialItems: provider.appreciationList,
                      ),
                    );
                  },
                  dataContent: provider.appreciationList.isEmpty
                      ? null
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: provider.appreciationList
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.description,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),

                const SizedBox(height: 16),

                // Update Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF130160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String iconPath,
    required bool isEmpty,
    required VoidCallback onActionPressed,
    required Widget? dataContent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(iconPath, width: 24, height: 24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              InkWell(
                onTap: onActionPressed,
                child: SvgPicture.asset(
                  isEmpty ? 'asset/icons/Add Icon.svg' : 'asset/icons/Edit.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          if (!isEmpty && dataContent != null) dataContent,
        ],
      ),
    );
  }
}
