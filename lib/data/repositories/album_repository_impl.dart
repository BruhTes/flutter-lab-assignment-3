import '../../domain/entities/album.dart';
import '../../domain/entities/photo.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasources/remote/album_remote_data_source.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;

  AlbumRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Album>> getAlbums() async {
    return await remoteDataSource.getAlbums();
  }

  @override
  Future<List<Photo>> getPhotosForAlbum(int albumId) async {
    return await remoteDataSource.getPhotosForAlbum(albumId);
  }
} 