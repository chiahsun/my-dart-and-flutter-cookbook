import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('No file name provided');
    return;
  }
  var file = File(args[0]);
  var lines = utf8.decoder
    .bind(file.openRead())
    .transform(const LineSplitter());
  await for (final line in lines) {
    if (!line.startsWith('#')) print(line);
  }
}