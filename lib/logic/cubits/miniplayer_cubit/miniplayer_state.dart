part of 'miniplayer_cubit.dart';

class MiniPlayerState extends Equatable {
  final String? name;
  final String? title;
  final String? imageUrl;
  final String? preview;
  final bool? isShow;

  const MiniPlayerState({
    this.name,
    this.title,
    this.imageUrl,
    this.preview,
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
      isShow: isShow ?? this.isShow,
    );
  }

  @override
  String toString() {
    return '''PostState { name: $name, title: $title, preview: $preview ,imageUrl: $imageUrl }''';
  }

  @override
  List<Object> get props => [name!, title!, imageUrl!, preview!, isShow!];
}
