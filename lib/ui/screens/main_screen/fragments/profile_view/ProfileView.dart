import 'package:flutter/material.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';

import 'ProfileViewModel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {},
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
