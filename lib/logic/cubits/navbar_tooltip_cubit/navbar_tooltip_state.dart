part of 'navbar_tooltip_cubit.dart';

// ignore: must_be_immutable
abstract class NavbarTooltipState extends Equatable {
  String? _tooltip;

  String get tooltip => _tooltip!;

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class NavbarTooltipChange extends NavbarTooltipState {
  String? _tooltip;

  NavbarTooltipChange(this._tooltip);

  @override
  String get tooltip => _tooltip!;
  @override
  List<Object> get props => [this._tooltip!];
}
