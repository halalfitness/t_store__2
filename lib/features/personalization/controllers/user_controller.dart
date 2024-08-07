import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repositries.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final User = await userRepository.fetchUserDetails();
      this.user(User);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.splitFullName(userCredentials.user!.displayName ?? "");
        final username =
            UserModel.createUsername(userCredentials.user!.displayName ?? "");

        final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0], // Fixed index to 0 for firstName
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          email: userCredentials.user!.email ?? " ",
          username: username,
          profilePicture: userCredentials.user!.photoURL ?? "",
        );

        await userRepository.saveUserRecord(newUser);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong with your information. You can re-save your data in your profile");
    }
  }
}
