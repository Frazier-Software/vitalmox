/// Application Environment
enum AppEnv {
  dev,
  production,
}

/// Application Configuration
final class AppConfig {
  AppConfig({
    required this.env,
  });

  final AppEnv env;

  @override
  String toString() => 'AppConfig{env: $env}';
}
