
void main() {
  try {
    throw StateError('Sample error');
  } on StateError catch (e) {
    print('Catch an error: $e');
  }
}