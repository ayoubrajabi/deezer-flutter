part of 'miniplayer_cubit.dart';

// ignore: must_be_immutable
abstract class MiniPlayerState extends Equatable {
  String? _artistName;
  String? _trackTitle;
  String? _trackPreview;
  String? _trackImageUrl;
  bool? _showMiniPlayer;

  String get trackImageUrl => _trackImageUrl!;
  String get artistName => _artistName!;
  String get trackTitle => _trackTitle!;
  String get trackPreview => _trackPreview!;
  bool get showMiniPlayer => _showMiniPlayer!;

  @override
  List<Object> get props => [
        _artistName!,
        _trackImageUrl!,
        _showMiniPlayer!,
        _trackPreview!,
        _trackTitle!
      ];
}

// ignore: must_be_immutable
class ArtistName extends MiniPlayerState {
  String? _artistName;

  ArtistName(this._artistName);

  @override
  String get artistName => _artistName!;

  @override
  List<Object> get props => [this._artistName!];
}

// ignore: must_be_immutable
class TrackTitle extends MiniPlayerState {
  String? _trackTitle;

  TrackTitle(this._trackTitle);

  @override
  String get trackTitle => _trackTitle!;

  @override
  List<Object> get props => [this._trackTitle!];
}

// ignore: must_be_immutable
class TrackPreview extends MiniPlayerState {
  String? _trackPreview;

  TrackPreview(this._trackPreview);

  @override
  String get trackPreview => _trackPreview!;

  @override
  List<Object> get props => [this._trackPreview!];
}

// ignore: must_be_immutable
class TrackImageUrl extends MiniPlayerState {
  String? _trackImageUrl;

  TrackImageUrl(this._trackImageUrl);

  @override
  String get trackImageUrl => _trackImageUrl!;

  @override
  List<Object> get props => [this._trackImageUrl!];
}

// ignore: must_be_immutable
class ShowMiniPlayer extends MiniPlayerState {
  bool? _showMiniPlayer;

  ShowMiniPlayer(this._showMiniPlayer);

  @override
  bool get showMiniPlayer => _showMiniPlayer!;

  @override
  List<Object> get props => [this._showMiniPlayer!];
}
