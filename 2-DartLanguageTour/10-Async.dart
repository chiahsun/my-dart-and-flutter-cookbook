
import 'dart:io';

const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> createDescriptions(Iterable<String> filenames) async {
  for (final filename in filenames) {
    try {
      final file = File('$filename');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File $filename already exists and was modified on $modified');
        continue;
      }
      await file.create();
      print('Create $filename');
      await file.writeAsString('Start describing $filename in this file');
    } on IOException catch (e) {
      print('Cannot create description for $filename: $e');
    }
  }
}

// TODO: async* for streams

Future<void> main() async {
  printWithDelay('Hello at 1s after');
  print("It's me");
  await printWithDelay('Hello at 1s after');
  print("It's me again");

  createDescriptions(["1.txt", "2.txt"]);
}