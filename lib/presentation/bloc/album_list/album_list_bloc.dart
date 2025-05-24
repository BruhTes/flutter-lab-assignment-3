import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/album_repository.dart';
import 'album_list_event.dart';
import 'album_list_state.dart';

class AlbumListBloc extends Bloc<AlbumListEvent, AlbumListState> {
  final AlbumRepository albumRepository;

  AlbumListBloc({required this.albumRepository}) : super(AlbumListInitial()) {
    on<LoadAlbums>(_onLoadAlbums);
  }

  Future<void> _onLoadAlbums(
    LoadAlbums event,
    Emitter<AlbumListState> emit,
  ) async {
    emit(AlbumListLoading());
    try {
      final albums = await albumRepository.getAlbums();
      emit(AlbumListLoaded(albums));
    } catch (e) {
      emit(AlbumListError(e.toString()));
    }
  }
} 