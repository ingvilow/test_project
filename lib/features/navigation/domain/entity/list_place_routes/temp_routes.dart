import 'package:go_router/go_router.dart';
import 'package:test_case/features/navigation/domain/entity/app_route_names.dart';
import 'package:test_case/features/navigation/domain/entity/app_route_paths.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_screen.dart';

/// All routes for the list_place_routes feature.
final List<GoRoute> tempRoutes = [
  GoRoute(
    path: AppRoutePaths.tempScreen,
    name: AppRouteNames.tempScreen,
    builder: (context, state) => const ListPlacesScreen(),
  ),
];
