part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoadingState extends EpisodesState {}

class EpisodesLoadedState extends EpisodesState {
  final List<EpisodeModel> episodeModelList;

  EpisodesLoadedState({required this.episodeModelList});
}

class EpisodesErrorState extends EpisodesState {
  final CatchException message;

  EpisodesErrorState(this.message);
}
