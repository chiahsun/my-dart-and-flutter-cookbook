
import '5-Classes.dart';

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

void main() {
  Orbiter o = Orbiter("orbiter", DateTime(2024), 5000);
  print(o);
}