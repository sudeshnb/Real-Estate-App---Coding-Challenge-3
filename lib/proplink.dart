import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/features/home/presentation/cubit/favorite.dart';
import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'src/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/theme/theme.dart';
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "PropLink",
            theme: AppTheme.light,
            initialRoute: RoutesName.initial,
            onGenerateRoute: AppRoute.generate,
          ),
        ),
      ),
    );
  }
}
