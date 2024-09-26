import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'GOOGLE_MAP_API_KEY',
    obfuscate: true,
  )
  static final String GOOGLE_MAP_API_KEY = _Env.GOOGLE_MAP_API_KEY;
}
