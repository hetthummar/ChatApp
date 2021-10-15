import 'package:flutter/material.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';
import 'package:chatapp/ui/screens/main_screen/MainScreenHolderViewModel.dart';

class MainScreenHolderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenHolderViewModel>(
      onModelReady: (model) {},
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text("Main Screen"),
          ),
        );
      },
    );
  }
}
