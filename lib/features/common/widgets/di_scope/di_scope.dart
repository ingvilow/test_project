import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/service/api_service.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope extends StatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<IAppScope> factory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DiScopeState createState() => _DiScopeState();
}

class _DiScopeState extends State<DiScope> {
  late IAppScope scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAppScope>(
          create: (_) => scope,
          child: widget.child,
        ),
        Provider<PlaceApiService>(
          create: (_) => PlaceApiService(scope.dio),
          child: widget.child,
        ),
      ],
    );
  }
}
