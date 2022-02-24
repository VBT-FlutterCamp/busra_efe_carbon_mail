import 'package:hm_carbon_mail/feature/httpService/model/mail_model.dart';
import 'package:http/http.dart' as http;

class MailService {
  Future<List<MailModel>> fetchPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      return mailModelFromJson(response.body);
    } else {
      throw Exception("Hata Oluştu..");
    }
  }
}
