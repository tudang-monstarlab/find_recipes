import '../data/api/api_config.dart';

enum AppFlavorType {
  development,
  production,
}

class AppFlavor {
  AppFlavor({
    required this.apiConfig,
    required this.appFlavorType,
  });

  final ApiConfig apiConfig;
  final AppFlavorType appFlavorType;
}

class AppFlavorValue {
  static final AppFlavor development = AppFlavor(
    apiConfig: ApiConfig('https://www.themealdb.com'),
    appFlavorType: AppFlavorType.development,
  );
  static final AppFlavor production = AppFlavor(
    apiConfig: ApiConfig('https://www.themealdb.com'),
    appFlavorType: AppFlavorType.production,
  );
}
