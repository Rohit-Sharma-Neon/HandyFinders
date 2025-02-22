import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_image_component_model.dart';
export 'add_image_component_model.dart';

class AddImageComponentWidget extends StatefulWidget {
  const AddImageComponentWidget({super.key});

  @override
  State<AddImageComponentWidget> createState() =>
      _AddImageComponentWidgetState();
}

class _AddImageComponentWidgetState extends State<AddImageComponentWidget> {
  late AddImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddImageComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, _, __) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/icAddPlus.png',
              fit: BoxFit.cover,
              alignment: Alignment(0.0, 0.0),
            ),
          ),
        );
      },
    );
  }
}
