
import 'api_base_url.dart';
import 'package:http/http.dart' as http;
// import 'package:smh_user/WebService/';
typedef OnError = void Function(String);
typedef OnSuccses = void Function(String);


class APIServes{

  void get(String url,OnError onError,OnSuccses onSuccses) async {

    final uri = Uri.parse(APIBase.baseURL + url);

    // var  base = ;

    // var requseturl = Uri.http(base,"");

    var request = await http.get(uri);
    if (request.statusCode != 200){

      onError(request.body.toString());
      return;
    }
    onSuccses(request.body);
  }}
