import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/album_model.dart';
import '../../models/photo_model.dart';

abstract class AlbumRemoteDataSource {
  Future<List<AlbumModel>> getAlbums();
  Future<List<PhotoModel>> getPhotosForAlbum(int albumId);
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  final http.Client client;

  AlbumRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AlbumModel>> getAlbums() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Future<List<PhotoModel>> getPhotosForAlbum(int albumId) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
} 