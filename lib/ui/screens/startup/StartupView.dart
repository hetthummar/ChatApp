import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';
import 'package:chatapp/ui/screens/startup/StartupViewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartupViewModel>(
      onModelReady: (model) {
        SchedulerBinding.instance?.addPostFrameCallback(
          (timeStamp) {
            model.runStartupLogic();
          },
        );
      },
      builder: (BuildContext context, model, Widget? child) {
        return Center(child: Text("Splash Screen"));
      },
    );
  }
}
