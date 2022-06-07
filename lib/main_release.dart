import 'package:test_case/config/app_config.dart';
import 'package:test_case/config/debug_options.dart';
import 'package:test_case/config/environment/build_types.dart';
import 'package:test_case/config/environment/environment.dart';
import 'package:test_case/config/urls.dart';
import 'package:test_case/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
