import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'custom_image_cropper_model.dart';
export 'custom_image_cropper_model.dart';

class CustomImageCropperWidget extends StatefulWidget {
  const CustomImageCropperWidget({
    super.key,
    required this.pickedImage,
  });

  final FFUploadedFile? pickedImage;

  @override
  State<CustomImageCropperWidget> createState() =>
      _CustomImageCropperWidgetState();
}

class _CustomImageCropperWidgetState extends State<CustomImageCropperWidget> {
  late CustomImageCropperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomImageCropperModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: custom_widgets.ImageCropper(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: MediaQuery.sizeOf(context).height * 0.6,
        ),
      ),
    );
  }
}
