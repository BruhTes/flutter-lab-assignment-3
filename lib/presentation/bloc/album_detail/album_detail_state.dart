import 'package:equatable/equatable.dart';
import '../../../domain/entities/photo.dart';

abstract class AlbumDetailState extends Equatable {
  const AlbumDetailState();

  @override
  List<Object?> get props => [];
}

class AlbumDetailInitial extends AlbumDetailState {}

class AlbumDetailLoading extends AlbumDetailState {}

class AlbumDetailLoaded extends AlbumDetailState {
  final List<Photo> photos;

  const AlbumDetailLoaded(this.photos);

  @override
  List<Object?> get props => [photos];
}

class AlbumDetailError extends AlbumDetailState {
  final String message;

  const AlbumDetailError(this.message);

  @override
  List<Object?> get props => [message];
} 