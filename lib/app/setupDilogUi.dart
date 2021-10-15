import 'package:flutter/material.dart';
import 'package:chatapp/config/ColorConfig.dart';
import 'package:chatapp/di/locator.dart';
import 'package:chatapp/utils/enums/dilogEnum.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDilogUi() {
  final dilogService = locator<DialogService>();

  final builders = {
    dilogEnum.saveOrNot: (context, sheetRequest, completer) =>
        LogoutDilog(request: sheetRequest, completer: completer),
    dilogEnum.succes: (context, sheetRequest, completer) =>
        SuccesDilog(request: sheetRequest, completer: completer),
    dilogEnum.confirmation: (context, sheetRequest, completer) =>
        ConfirmationDilog(request: sheetRequest, completer: completer),
    dilogEnum.failure: (context, sheetRequest, completer) =>
        FailureDilog(request: sheetRequest, completer: completer),
    dilogEnum.customplan: (context, sheetRequest, completer) =>
        CustomPlanDilog(request: sheetRequest, completer: completer),
  };

  dilogService.registerCustomDialogBuilders(builders);
}

class FailureDilog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  FailureDilog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          overflow: Overflow.visible,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 13, top: 50, right: 13, bottom: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        request.title ?? "Failure",
                        style: TextStyle(fontSize: 23),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(request.description ?? "Some problem occured",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            completer(DialogResponse(confirmed: true));
                          },
                          child: Container(
                            color: ColorConfig.redColor,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Center(
                                  child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              child: Container(
                width: 100,
                height: 100, //
                child: Image.asset("assets/images/wrong.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccesDilog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  SuccesDilog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          overflow: Overflow.visible,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 13, top: 50, right: 13, bottom: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        request.title ?? "Success",
                        style: TextStyle(fontSize: 23),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                          request.description ??
                              "Information saved Succesfully",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            completer(DialogResponse(confirmed: true));
                          },
                          child: Container(
                            color: ColorConfig.greenColor,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Center(
                                  child: Text(
                                request.mainButtonTitle ?? "OK",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              child: Container(
                width: 100,
                height: 100, //
                child: Image.asset("assets/images/right_success.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutDilog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  LogoutDilog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 13, top: 13, right: 21, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.power_settings_new,
                          color: ColorConfig.greyColor2),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        request.title ?? "Are you sure",
                        style: TextStyle(
                          fontSize: 21,
                          color: ColorConfig.greyColor2,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    request.description ?? "Are you sure you want to logout?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'ProximaNova'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        DialogResponse _dialogResponse =
                            DialogResponse(confirmed: false);
                        completer(_dialogResponse);
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(
                            color: ColorConfig.greyColor2, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    RaisedButton(
                        color: ColorConfig.greyColor2,
                        elevation: 0,
                        onPressed: () async {
                          DialogResponse _dialogResponse =
                              DialogResponse(confirmed: true);
                          completer(_dialogResponse);
                        },
                        child: Text(
                          'YES',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )),
                    const SizedBox(
                      width: 17,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationDilog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  ConfirmationDilog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 13, top: 13, right: 21, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete, color: ColorConfig.greyColor2),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 21,
                          color: ColorConfig.greyColor2,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Are you sure that you want to \nRemove.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'ProximaNova'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        DialogResponse _dialogResponse =
                            DialogResponse(confirmed: false);
                        completer(_dialogResponse);
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(
                            color: ColorConfig.greyColor2, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    RaisedButton(
                        color: ColorConfig.greyColor2,
                        elevation: 0,
                        onPressed: () async {
                          DialogResponse _dialogResponse =
                              DialogResponse(confirmed: true);
                          completer(_dialogResponse);
                        },
                        child: Text(
                          'YES',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )),
                    const SizedBox(
                      width: 17,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPlanDilog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  CustomPlanDilog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 13, top: 13, right: 21, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete, color: ColorConfig.greyColor2),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 21,
                          color: ColorConfig.greyColor2,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Are you sure that you want to \nRemove.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: 'ProximaNova'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        DialogResponse _dialogResponse =
                            DialogResponse(confirmed: false);
                        completer(_dialogResponse);
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(
                            color: ColorConfig.greyColor2, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    RaisedButton(
                      color: ColorConfig.greyColor2,
                      elevation: 0,
                      onPressed: () async {
                        DialogResponse _dialogResponse =
                            DialogResponse(confirmed: true);
                        completer(_dialogResponse);
                      },
                      child: Text(
                        'YES',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
