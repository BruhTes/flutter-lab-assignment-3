import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/album_repository.dart';
import 'album_detail_event.dart';
import 'album_detail_state.dart';

class AlbumDetailBloc extends Bloc<AlbumDetailEvent, AlbumDetailState> {
  final AlbumRepository albumRepository;

  AlbumDetailBloc({required this.albumRepository}) : super(AlbumDetailInitial()) {
    on<LoadAlbumPhotos>(_onLoadAlbumPhotos);
  }

  Future<void> _onLoadAlbumPhotos(
    LoadAlbumPhotos event,
    Emitter<AlbumDetailState> emit,
  ) async {
    emit(AlbumDetailLoading());
    try {
      final photos = await albumRepository.getPhotosForAlbum(event.albumId);
      emit(AlbumDetailLoaded(photos));
    } catch (e) {
      emit(AlbumDetailError(e.toString()));
    }
  }
} 