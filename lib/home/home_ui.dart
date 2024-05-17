import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/home/home_cubit.dart';
import 'package:mixes/home/home_state.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class HomeUi extends StatefulWidget {
  const HomeUi({super.key});


  static const String routeName = "/home_ui";
  static Widget builder(BuildContext context) => BlocProvider(
      create: (context) => HomeCubit(HomeState()),
      child: const HomeUi(),
  );

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 7),
              child: Text(
                  AppLocalizations.of(context)?.longMessage ?? "",
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
    );
  }
}
