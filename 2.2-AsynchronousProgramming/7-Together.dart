
// Part 1
addHello(String user) {
  return 'Hello $user';
}

// Part 2
// You can call the provided async function fetchUsername()
// to return the username.
Future<String> greetUser() async {
  final username = await fetchUsername();
  final greeting = addHello(username);
  return greeting;
}

// Part 3
// You can call the provided async function logoutUser()
// to log out the user.
Future<String> sayGoodbye() async {
  try {
    final user = await logoutUser();
    return '$user Thanks, see you next time';
  } catch (err) {
    return 'Oops: $err';
  }
}

Future<String> fetchUsername() {
  return Future.delayed(const Duration(seconds: 1), () => 'Jon');
}

Future<String> logoutUser() {
  // return Future.delayed(const Duration(seconds: 1), () => 'Jon');
  return Future.delayed(const Duration(seconds: 1), () => throw 'Fail to logout');
}

Future<void> main() async {
  print(await greetUser());
  print(await sayGoodbye());
}