import 'package:flutter/material.dart';
import 'package:chatapp/di/locator.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;

  BaseView({required this.builder, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<T>(
          create: (context) => model,
          child: Consumer<T>(builder: widget.builder)),
    );
  }
}
