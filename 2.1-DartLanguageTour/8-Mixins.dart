
import '5-Classes.dart';

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('# astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);

}

void main() {
  PilotedCraft pc = PilotedCraft("a craft", DateTime(2023));
  pc.describeCrew();
}