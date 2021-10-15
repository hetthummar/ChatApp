import 'package:flutter/material.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';

import 'HomeViewModel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {},
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
