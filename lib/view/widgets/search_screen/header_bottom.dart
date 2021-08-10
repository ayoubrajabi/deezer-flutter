import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderBottom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: TextField(
        onSubmitted: (value) {
          if (value == '') {
            return context.read<SearchBloc>().add(DisposeSearch());
          }
          return context
              .read<SearchBloc>()
              .add(FeatchSearch('search', '', {'q': value}));
        },
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white10,
          hintText: 'Search Artists, Albums, Tracks ...',
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontSize: 14.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.white54,
              width: 0.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          filled: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 83.0);
}
