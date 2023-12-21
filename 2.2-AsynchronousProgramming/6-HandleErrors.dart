
// Implement changeUsername here
Future<String> changeUsername() async {
  try {
    final username = await fetchNewUsername();
    return username;
  } catch (err) {
    return err.toString();
  }
}

Future<String> fetchNewUsername() {
  // return Future.delayed(const Duration(seconds: 1), () => 'jane_smith_92');
  return Future.delayed(const Duration(seconds: 1), () => throw 'Fail to change name');
}

void main() async {
  print(await changeUsername());
}
