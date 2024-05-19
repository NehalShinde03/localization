import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit(super.initialState);

}

/*MaterialApp(
  title: appName,
  theme: ThemeData(
    useMaterial3: true,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  ),
);*/


/*Container(
  color: Theme.of(context).colorScheme.primary,
  child: Text(
    'Text with a background color',
    // ···
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
  ),
),*/


/*
* Override a theme
#
To override the overall theme in part of an app, wrap that section of the app in a Theme widget.

You can override a theme in two ways:

Create a unique ThemeData instance.
Extend the parent theme.
*
*
*
*
* Theme(
  // Create a unique theme with `ThemeData`.
  data: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
    ),
  ),
  child: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
);
*
*
* Theme(
  // Find and extend the parent theme using `copyWith`.
  // To learn more, check out the section on `Theme.of`.
  data: Theme.of(context).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
    ),
  ),
  child: const FloatingActionButton(
    onPressed: null,
    child: Icon(Icons.add),
  ),
);*/