import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_tooltip_state.dart';

class NavbarTooltipCubit extends Cubit<NavbarTooltipState> {
  NavbarTooltipCubit() : super(NavbarTooltipChange('اخبار'));

  void navBarTooltipChange(String tooltip) =>
      emit(NavbarTooltipChange(tooltip));
}
