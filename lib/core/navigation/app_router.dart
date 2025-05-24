import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/album_list/album_list_page.dart';
import '../../presentation/pages/album_detail/album_detail_page.dart';

class AppRouter {
  static const String home = '/';
  static const String albumDetail = '/album/:id';

  static String getAlbumDetailPath(int id) => '/album/$id';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const AlbumListPage(),
      ),
      GoRoute(
        path: albumDetail,
        name: 'album-detail',
        builder: (context, state) {
          final albumId = int.parse(state.pathParameters['id']!);
          return AlbumDetailPage(albumId: albumId);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );
} 