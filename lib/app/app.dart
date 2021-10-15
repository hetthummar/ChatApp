import 'package:chatapp/ui/screens/base/temp/TempView.dart';
import 'package:chatapp/ui/screens/main_screen/MainScreenHolderView.dart';
import 'package:chatapp/ui/screens/main_screen/registration/googlelogin/GoogleLoginView.dart';
import 'package:chatapp/ui/screens/startup/StartupView.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: TempView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: MainScreenHolderView),
    MaterialRoute(page: GoogleLoginView),
  ],
)
class AppSetup {}
