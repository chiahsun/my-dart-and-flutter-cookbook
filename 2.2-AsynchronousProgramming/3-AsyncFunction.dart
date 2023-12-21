
Future<void> printOrderMessage() async {
  print("Awaiting user order ...");
  var order = await fetchUserOrder();
  // print("Awaiting user order ...");
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}

void main() async {
  countSeconds(4);
  await printOrderMessage();
}

void countSeconds(int s) {
  for (var i = 1; i <= s; ++i) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}