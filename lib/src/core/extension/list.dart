import 'package:flutter/material.dart';
import 'package:proplink/src/core/constants/constants.dart';

extension MyIterable<E> on List<E> {
  List<E> ascending(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));

  List<E> descending(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(b).compareTo(key(a)));
}

extension ListX on List<Widget> {
  List<Padding> padding(EdgeInsetsGeometry space) {
    return map((e) => Padding(padding: space, child: e)).toList();
  }

  List<Widget> horizontalGap(double space) {
    return length <= 1
        ? this
        : sublist(1).fold(
            [first],
            (previous, element) =>
                [...previous, AppSpace.wSpacer(space), element],
          );
  }

  List<Widget> verticalGap(double space) {
    return length <= 1
        ? this
        : sublist(1).fold(
            [first],
            (previous, element) =>
                [...previous, AppSpace.hSpacer(space), element],
          );
  }
}
