import 'package:flutter/material.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';

import 'TempViewModel.dart';

class TempView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BaseView<TempViewModel>(
        onModelReady: (model) {},
        builder: (BuildContext context, model, Widget? child) {
          return Center(
            child: Text("Temp Text"),
          );
        },
      ),
    );
  }
}
