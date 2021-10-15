import 'package:chatapp/app/app.router.dart';
import 'package:chatapp/di/locator.dart';
import 'package:chatapp/services/FirebaseAuthService.dart';
import 'package:chatapp/ui/screens/base/ViewState.dart';
import 'package:chatapp/ui/screens/base/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class GoogleLoginViewModel extends BaseModel {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();

  signInWithGoogle() async {
    showProgressBar();
    String result = await _authService.signInWithGoogle();

    if (result == "Success") {
      stopProgressBar();
      getNavigationService().navigateTo(Routes.mainScreenHolderView);
    } else if (result == "account not selected") {
      stopProgressBar();
    } else {
      stopProgressBar();
      if (result.contains("network_error")) {
        await showErrorDilog(
            title: "No Internet Connection",
            description: "Please make sure that you are connected to internet");
      } else {
        await showErrorDilog(description: result);
      }
    }
  }
}
