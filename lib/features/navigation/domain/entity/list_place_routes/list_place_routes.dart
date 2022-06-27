import 'package:go_router/go_router.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen.dart';
import 'package:test_case/features/navigation/domain/entity/app_route_names.dart';
import 'package:test_case/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the list_place_routes feature.
final List<GoRoute> listPlaceRoutes = [
  GoRoute(
    path: AppRoutePaths.listPlaceScreen,
    name: AppRouteNames.listPlaceScreen,
    builder: (context, state) => const ListPlacesScreen(),
  ),
];
