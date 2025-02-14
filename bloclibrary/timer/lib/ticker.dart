class Ticker {
  final int _ticks;
  const Ticker(this._ticks);
  Stream<int> tick() =>
      Stream.periodic(const Duration(seconds: 1), (x) => _ticks - x - 1).take(_ticks);

  int get ticks => _ticks;
}
