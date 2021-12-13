import 'package:flutter_template/config/build_types.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/config/debug_options.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: Config(
      url: Url.prodUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}