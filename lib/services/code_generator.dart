import 'dart:math';

class CodeGenerator {
  static Random random = Random();

  static String generateCode(String prefix) {
    var id = random.nextInt(92143543) + 09451234356;
    return '$prefix-${id.toString().substring(0, 8)}';
  }
}
