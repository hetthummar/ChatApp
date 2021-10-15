import 'package:chatapp/services/FirebaseAuthService.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/app/app.router.dart';
import 'package:chatapp/data/DataManager.dart';
import 'package:chatapp/data/prefs/SharedpreferenceService.dart';
import 'package:chatapp/di/locator.dart';
import 'package:chatapp/ui/screens/base/ViewState.dart';
import 'package:chatapp/utils/StartupHelpers.dart';
import 'package:chatapp/utils/enums/bottomSheetEnum.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseModel extends ChangeNotifier {
  DataManager _appDataManager = locator<DataManager>();
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  DialogService _dilogService = locator<DialogService>();
  SharedPreferenceService _sharedPreferenceService =
      locator<SharedPreferenceService>();
  NavigationService _naviagationSerive = locator<NavigationService>();
  StartupHelpers _startupHelpers = locator<StartupHelpers>();
  FirebaseAuthService _authService = locator<FirebaseAuthService>();

  DataManager getDataManager() => _appDataManager;

  SharedPreferenceService getSharedPreferenceService() =>
      _sharedPreferenceService;

  NavigationService getNavigationService() => _naviagationSerive;

  BottomSheetService getbottomSheetService() => _bottomSheetService;

  DialogService getDilogService() => _dilogService;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState, {bool shouldUpdate = true}) {
    if (shouldUpdate) {
      _state = viewState;
      notifyListeners();
    }
  }

  refreshScreen() {
    notifyListeners();
  }

  showProgressBar({String title = "Please wait..."}) {
    EasyLoading.show(status: title);
  }

  stopProgressBar() {
    EasyLoading.dismiss();
  }

  goToPreviousScreen() {
    getNavigationService().back();
  }

  @override
  void dispose() {}

  showErrorDilog(
      {String title = "Problem occured",
      String description = "Some problem occured Please try again",
      bool isdimissible = true}) async {
    await _bottomSheetService.showCustomSheet(
        title: title,
        description: description,
        mainButtonTitle: "OK",
        variant: bottomSheetEnum.error,
        barrierDismissible: isdimissible);
  }

  showNoInternetAlert(
      {String title = "PhoneAuthHolderViewModelnet Connection",
      String description = "Please Connect to Stable Network and Try Again",
      bool isdismmisible = false,
      mainButtonTitle = "RETRY"}) async {
    await _bottomSheetService.showCustomSheet(
        title: title,
        description: description,
        mainButtonTitle: mainButtonTitle,
        variant: bottomSheetEnum.noInternet,
        barrierDismissible: isdismmisible);
  }

  runStartupLogic() async {
    bool isLoggedIn = await _authService.isLoggedIn();
    if (isLoggedIn) {
      getNavigationService().clearStackAndShow(Routes.mainScreenHolderView);
    } else {
      getNavigationService().clearStackAndShow(Routes.googleLoginView);
    }
  }
}
