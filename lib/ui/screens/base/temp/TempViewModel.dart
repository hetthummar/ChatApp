import 'package:chatapp/ui/screens/base/base_view_model.dart';

class TempViewModel extends BaseModel {}

class Dialogue {
  static String dialoguePicker(int val) {
    switch (val) {
      case 1:
        return "You rolled 1, You earned 500 gems, brave adventurer!";
        break;
      case 2:
        return "You rolled 2, You now have to face a monster and win!";
        break;
      case 3:
        return "You rolled 3, You get an extra life, adventurer!";
        break;
      case 4:
        return "You rolled 4, You get a brand new sword brave adventurer!";
        break;
      case 5:
        return "You rolled 5, You get a new shield brave adventurer!";
        break;
      case 6:
        return "You rolled 6, You get a Full HP health potion!";
        break;
      default:
        return " I am sorry adventurer we have ran out of goods at the moment";
    }
  }
}
