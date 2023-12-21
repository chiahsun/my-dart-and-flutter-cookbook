
String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

void main() {
  print(createOrderMessage());
}