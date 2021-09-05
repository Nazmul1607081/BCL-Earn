import 'package:image_picker/image_picker.dart';

class MyImagePickerHelper {
  final ImagePicker _picker = ImagePicker();

  Future<XFile> pickImageFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile> pickImageFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
