import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/core/constants/constants.dart';
import 'package:proplink/src/core/widgets/shrink.dart';
import 'package:proplink/src/features/home/presentation/bloc/bloc.dart';

class AppFailureWidget extends StatelessWidget {
  const AppFailureWidget({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPadding.h20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
              style: AppTextStyle.style1,
            ),
            AppSpace.h50,
            ShrinkButton(
              onPressed: () =>
                  context.read<PropertyBloc>().add(FetchProperties()),
              child: Container(
                decoration: AppDecoration.button,
                padding: AppPadding.button,
                child: Text(
                  'Try again',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.style1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
