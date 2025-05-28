import 'dart:math';

String numberGenerator({int length = 3}){
  const String numbers = '1234';
  Random random = Random();
  return List.generate(length, (index) => numbers[random.nextInt(numbers.length)],).join();
}