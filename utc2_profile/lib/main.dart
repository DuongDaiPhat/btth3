import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/database/database_helper.dart';
import 'features/profile/data/datasources/profile_local_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/profile/presentation/providers/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Database Helper
  final databaseHelper = DatabaseHelper.instance;
  
  // Dependency Injection
  final localDataSource = ProfileLocalDataSourceImpl(databaseHelper: databaseHelper);
  final profileRepository = ProfileRepositoryImpl(localDataSource: localDataSource);

  runApp(MyApp(profileRepository: profileRepository));
}

class MyApp extends StatelessWidget {
  final ProfileRepositoryImpl profileRepository;

  const MyApp({Key? key, required this.profileRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(repository: profileRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Profile App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const ProfilePage(),
      ),
    );
  }
}
