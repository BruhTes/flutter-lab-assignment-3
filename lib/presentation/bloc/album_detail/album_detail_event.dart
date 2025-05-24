import 'package:equatable/equatable.dart';

abstract class AlbumDetailEvent extends Equatable {
  const AlbumDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadAlbumPhotos extends AlbumDetailEvent {
  final int albumId;

  const LoadAlbumPhotos(this.albumId);

  @override
  List<Object?> get props => [albumId];
} 