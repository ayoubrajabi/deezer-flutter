part of 'miniplayer_cubit.dart';

class MiniPlayerState extends Equatable {
  final String? name;
  final String? title;
  final String? imageUrl;
  final bool? isShow;

  const MiniPlayerState({this.name, this.title, this.imageUrl, this.isShow});

  MiniPlayerState copyWith({
    String? name,
    String? title,
    String? imageUrl,
    bool? isShow,
  }) {
    return MiniPlayerState(
      name: name ?? this.name,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      isShow: isShow ?? this.isShow,
    );
  }

  @override
  String toString() {
    return '''PostState { name: $name, title: $title, imageUrl: $imageUrl }''';
  }

  @override
  List<Object> get props => [name!, title!, imageUrl!, isShow!];
}
