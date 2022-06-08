import 'package:flutter/material.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope<AppScope> extends StatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<AppScope> factory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DiScopeState createState() => _DiScopeState<AppScope>();
}

class _DiScopeState<T> extends State<DiScope<T>> {
  late AppScope scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory() as AppScope;
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AppScope>(
      create: (_) => scope,
      child: widget.child,
    );
  }
}
