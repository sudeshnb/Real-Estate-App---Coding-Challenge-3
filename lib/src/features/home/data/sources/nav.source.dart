import 'package:proplink/src/core/constants/constants.dart';

import '../models/nav.model.dart';

List<NavModel> navItems = [
  NavModel(
    id: 0,
    selected: AssetPath.homeSelected,
    unselect: AssetPath.home,
  ),
  NavModel(
    id: 1,
    selected: AssetPath.hartSelected,
    unselect: AssetPath.hart,
  ),
  NavModel(
    id: 2,
    selected: AssetPath.profileSelected,
    unselect: AssetPath.profile,
  ),
  NavModel(
    id: 3,
    selected: AssetPath.settingsSelected,
    unselect: AssetPath.settings,
  ),
];
