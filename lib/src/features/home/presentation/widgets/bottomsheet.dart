import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/config/localizations.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/l10n/cubit/cubit.dart';
import 'package:proplink/src/core/l10n/l10n.dart';
import 'package:proplink/src/core/l10n/model/language.dart';
import 'package:proplink/src/core/widgets/icon.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.main,
      decoration: AppDecoration.bottomSheet(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              AppLn.of(context)!.desiredlanguage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            AppSpace.h20,
            ...L10n.languages.map((e) => LanguageTile(language: e))
          ],
        ),
      ),
    );
  }
}

///
class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.language});
  final Language language;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        var isSelect = state.code == language.locale.languageCode;
        return GestureDetector(
          onTap: () {
            context
                .read<LanguageCubit>()
                .setLanguage(language.locale.languageCode);
            Navigator.pop(context);
          },
          child: Container(
            constraints: BoxConstraints(minHeight: 40.h),
            child: Row(
              children: [
                ActiveIcon(isActive: isSelect),
                AppSpace.w30,
                Text(language.flag, style: TextStyle(fontSize: 24.sp)),
                AppSpace.w10,
                Text(language.name, style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        );
      },
    );
  }
}
