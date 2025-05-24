import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/navigation/app_router.dart';
import 'data/datasources/remote/album_remote_data_source.dart';
import 'data/repositories/album_repository_impl.dart';
import 'domain/repositories/album_repository.dart';
import 'presentation/bloc/album_list/album_list_bloc.dart';
import 'presentation/bloc/album_detail/album_detail_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AlbumRepository>(
          create: (context) => AlbumRepositoryImpl(
            remoteDataSource: AlbumRemoteDataSourceImpl(
              client: http.Client(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AlbumListBloc>(
            create: (context) => AlbumListBloc(
              albumRepository: context.read<AlbumRepository>(),
            ),
          ),
          BlocProvider<AlbumDetailBloc>(
            create: (context) => AlbumDetailBloc(
              albumRepository: context.read<AlbumRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'Album App',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: const Color(0xFF43A047), // Material Green 600
              secondary: const Color(0xFF66BB6A), // Material Green 400
              surface: Colors.white, // Light Green 50
              error: const Color(0xFFE57373), // Light Red
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: const Color(0xFF212121), // Dark Grey
              onError: Colors.white,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xFF2196F3), // Material Blue
              foregroundColor: Colors.white,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3), // Material Blue
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
} 