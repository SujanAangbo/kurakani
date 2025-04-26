
import 'package:kurakani/common/utils/http.dart';

class NotificationApi {
  
  sendNotification(Map<String, dynamic> data) async {
    final res = await HttpUtil().post("api/sendMessage", data: data);
    print('result: $res');
  }
  
  
}
