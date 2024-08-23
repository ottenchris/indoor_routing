import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'JOURNEY_MAPS_API_KEY', obfuscate: true)
  static String journeyMapsApiKey = _Env.journeyMapsApiKey;
}
