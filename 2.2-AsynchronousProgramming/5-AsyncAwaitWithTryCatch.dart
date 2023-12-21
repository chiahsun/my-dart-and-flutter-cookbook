
import '3-AsyncFunction.dart';

Future<void> printOrderMessage() async {
  try {
    print('Awaiting user order ...');
    var order = await fetchUserOrder();
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrder() {
  var str = Future.delayed(const Duration(seconds: 4), () => throw "Cannot locate user order");
  return str;
}

void main() async {
  await printOrderMessage();
}