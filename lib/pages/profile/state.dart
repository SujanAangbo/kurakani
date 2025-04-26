import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kurakani/common/entities/entities.dart';

class ProfileState {
  Rx<UserItem> user;
  Rx<File?> selectedImage = Rx<File?>(null);

  ProfileState(this.user);
}
