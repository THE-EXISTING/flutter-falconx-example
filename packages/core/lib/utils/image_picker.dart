import 'package:core/app.dart';

class ImagePickerX {
  factory ImagePickerX.cameraAndStay({required int maxAssetsCount}) {
    return ImagePickerX._(
      name: 'Pick from camera and stay',
      description: 'Take a photo or video with the camera picker, '
          'select the result and stay in the entities list.',
      method: (BuildContext context, List<AssetEntity> assets) {
        return AssetPicker.pickAssets(
          context,
          maxAssets: maxAssetsCount,
          selectedAssets: assets,
          specialItemPosition: SpecialItemPosition.prepend,
          specialItemBuilder: (BuildContext context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              // onTap: () async {
              //   final AssetEntity? result = await CameraPicker.
              // pickFromCamera(
              //     context,
              //     enableRecording: true,
              //   );
              //   if (result == null) {
              //     return;
              //   }
              //   final AssetPicker<AssetEntity, AssetPathEntity> picker =
              //       context.findAncestorWidgetOfExactType()!;
              //   final DefaultAssetPickerProvider p =
              //       picker.builder.provider as DefaultAssetPickerProvider;
              //   await p.currentPathEntity!.refreshPathProperties();
              //   await p.switchPath(p.currentPathEntity!);
              //   p.selectAsset(result);
              // },
              child: const Center(
                child: Icon(
                  Icons.camera_enhance,
                  size: 42,
                ),
              ),
            );
          },
        );
      },
    );
  }

  factory ImagePickerX.camera({
    required int maxAssetsCount,
  }) {
    return ImagePickerX._(
      name: 'Pick from camera',
      description: 'Allow pick an asset through camera.',
      method: (BuildContext context, List<AssetEntity> assets) {
        return AssetPicker.pickAssets(
          context,
          maxAssets: maxAssetsCount,
          selectedAssets: assets,
          specialItemPosition: SpecialItemPosition.prepend,
          specialItemBuilder: (BuildContext context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              // onTap: () async {
              //   final AssetEntity? result = await 
              // CameraPicker.pickFromCamera(
              //     context,
              //     enableRecording: true,
              //   );
              //   if (result != null) {
              //     handleResult?.call(context, result);
              //   }
              // },
              child: const Center(
                child: Icon(Icons.camera_enhance, size: 42),
              ),
            );
          },
        );
      },
    );
  }

  factory ImagePickerX.image(int maxAssetsCount) {
    return ImagePickerX._(
      name: 'Image picker',
      description: 'Only pick images from device.',
      method: (BuildContext context, List<AssetEntity> assets) {
        return AssetPicker.pickAssets(
          context,
          maxAssets: maxAssetsCount,
          selectedAssets: assets,
          textDelegate: EnglishTextDelegate(),
        );
      },
    );
  }
  const ImagePickerX._({
    required this.name,
    required this.description,
    required this.method,
  });

  final String name;
  final String description;
  final Future<List<AssetEntity>?> Function(
    BuildContext context,
    List<AssetEntity> selectedAssets,
  ) method;

  static Future<List<AssetEntity>?> pickImage(
    BuildContext context,
    int maxAssetsCount,
  ) =>
      AssetPicker.pickAssets(
        context,
        maxAssets: maxAssetsCount,
        textDelegate: EnglishTextDelegate(),
      );

  static Future<List<AssetEntity>?> pickImageAndCameraStay(
    BuildContext context,
    int maxAssetsCount, {
    bool? enableRecording,
  }) =>
      AssetPicker.pickAssets(
        context,
        maxAssets: maxAssetsCount,
        specialItemPosition: SpecialItemPosition.prepend,
        textDelegate: EnglishTextDelegate(),
        specialItemBuilder: (BuildContext context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            // onTap: () async {
            //   final AssetEntity? result = await CameraPicker.pickFromCamera(
            //     context,
            //     enableRecording: enableRecording ?? true,
            //     textDelegate: EnglishCameraPickerTextDelegate(),
            //   );
            //   if (result == null) {
            //     return;
            //   }
            //   final picker = context.findAncestorWidgetOfExactType()!;
            //   final p = picker.builder.provider as 
            // DefaultAssetPickerProvider;
            //   await p.currentPathEntity!.refreshPathProperties();
            //   await p.switchPath(p.currentPathEntity!);
            //   p.selectAsset(result);
            // },
            child: const Center(
              child: Icon(Icons.camera_enhance, size: 42),
            ),
          );
        },
      );
}
