
enum PlanetType { terrestrial, gas, ice }

enum Planet {

  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false);

  const Planet({required this.planetType, required this.moons, required this.hasRings});

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant => planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void main() {
  Planet m = Planet.mercury;
  print(m);
  if (!m.isGiant) {
    print("Not a giant planet");
  }
}