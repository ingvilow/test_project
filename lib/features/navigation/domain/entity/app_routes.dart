import 'package:go_router/go_router.dart';
import 'package:test_case/features/navigation/domain/entity/list_place_routes/list_place_routes.dart';

import 'package:test_case/features/navigation/domain/entity/list_place_routes/list_place_routes.dart';

/// All routes of the app.
class AppRoutes implements AppRoutesDelegate {
  @override
  List<GoRoute> routeList = [
    ...listPlaceRoutes,
  ];
}

/// Interface routes of the app.
abstract class AppRoutesDelegate {
  /// List of registered routes.
  List<GoRoute> get routeList;
}
