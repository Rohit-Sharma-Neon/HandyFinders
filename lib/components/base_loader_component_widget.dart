import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'base_loader_component_model.dart';
export 'base_loader_component_model.dart';

class BaseLoaderComponentWidget extends StatefulWidget {
  const BaseLoaderComponentWidget({
    super.key,
    this.width,
    this.height,
    Color? backgroundColor,
  }) : this.backgroundColor = backgroundColor ?? const Color(0x00FFFFFF);

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  State<BaseLoaderComponentWidget> createState() =>
      _BaseLoaderComponentWidgetState();
}

class _BaseLoaderComponentWidgetState extends State<BaseLoaderComponentWidget> {
  late BaseLoaderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BaseLoaderComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Lottie.network(
        'https://lottie.host/b8db2b60-0521-484a-9d58-c81fca675335/wgv6v5fLSn.json',
        width: 80.0,
        height: 80.0,
        fit: BoxFit.contain,
        animate: true,
      ),
    );
  }
}
