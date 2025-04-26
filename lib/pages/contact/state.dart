import 'package:get/get.dart';
import 'package:kurakani/common/entities/contact.dart';

class ContactState {

  RxList<ContactItem> contacts = <ContactItem>[].obs;
  RxBool isLoading = false.obs;

}
