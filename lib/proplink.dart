import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/core/config/localizations.dart';
import 'package:proplink/src/core/theme/cubit/cubit.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';
import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'src/core/l10n/cubit/cubit.dart';
import 'src/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/features/home/presentation/bloc/bloc.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PropertyBloc()..add(FetchProperties()),
        ),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => ThemeCubit()..execute()),
        BlocProvider(create: (context) => LanguageCubit()..execute()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => DismissKeyboard(
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, lng) {
                  return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: state.isDark
                        ? SystemUiOverlayStyle.light
                        : SystemUiOverlayStyle.dark,
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: "PropLink",
                      theme: state.theme,
                      locale: Locale(lng.code),
                      initialRoute: RoutesName.initial,
                      onGenerateRoute: AppRoute.generate,
                      localizationsDelegates: AppLn.localizationsDelegates,
                      supportedLocales: AppLn.supportedLocales,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
