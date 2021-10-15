import 'package:chatapp/ui/screens/base/temp/TempViewModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing the dilog", () {
    test("test when user lands on 1", () {
      int val = 1;
      String dilog = Dialogue.dialoguePicker(val);
    });
  });

  test('title for your test', () {
    // your function body
    int a;
    int b = 5;
    int c = 5;
    a = b + c;
    expect(a, 10);
  });
}
