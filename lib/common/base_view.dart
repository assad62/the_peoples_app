
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locator.dart';
import 'base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;
  final Function(T)? getPassedArguments;

  BaseView({required this.builder, required this.onModelReady, this.getPassedArguments});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if(widget.getPassedArguments !=null){
       widget.getPassedArguments!(model);
    }

    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}