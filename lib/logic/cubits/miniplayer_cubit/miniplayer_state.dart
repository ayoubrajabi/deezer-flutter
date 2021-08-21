part of 'miniplayer_cubit.dart';

class MiniPlayerState extends Equatable {
  final String? name;
  final String? title;
  final String? imageUrl;
  final String? preview;
  final String? link;
  final bool? isShow;

  const MiniPlayerState({
    this.name,
    this.title,
    this.imageUrl,
    this.preview,
    this.link,
    this.isShow,
  });

  MiniPlayerState copyWith({
    String? name,
    String? title,
    String? imageUrl,
    String? preview,
    bool? isShow,
  }) {
    return MiniPlayerState(
      name: name ?? this.name,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      preview: preview ?? this.preview,
      link: link ?? this.link,
      isShow: isShow ?? this.isShow,
    );
  }

  @override
  List<Object> get props =>
      [name!, title!, imageUrl!, preview!, link!, isShow!];
}
