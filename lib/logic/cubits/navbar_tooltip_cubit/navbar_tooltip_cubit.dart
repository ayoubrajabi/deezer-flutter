import 'package:bloc/bloc.dart';

class NavbarTooltipCubit extends Cubit<String> {
  NavbarTooltipCubit() : super('Home');

  void navBarTooltipChange(String tooltip) => emit(tooltip);
}
