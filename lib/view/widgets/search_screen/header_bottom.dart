import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderBottom extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HeaderBottomState createState() => _HeaderBottomState();

  @override
  Size get preferredSize => const Size(double.infinity, 127.0);
}

class _HeaderBottomState extends State<HeaderBottom> {
  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: textEditingController,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) {
                if (searchState is SearchIsLoaded) {
                  return MaterialButton(
                    onPressed: () {
                      context.read<SearchBloc>().add(DisposeSearch());
                      textEditingController!.clear();
                    },
                    child: Text(
                      'clear search',
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }
                return const SizedBox(
                  height: 28.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
