import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shimmer_effect/Utils/Constant.dart';



class ApiService {

  getPosts() async {
    try{
      var response = await http.get(
          "$ApiBaseUrl/posts");
      var statusCode = response.statusCode;

      if (statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print("That is the response : $jsonResponse");
        return jsonResponse;
      }else {
        print("Another status response : $statusCode");
      }

    }catch(e){
      print("This is the error : $e");
    }
  }

}