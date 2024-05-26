import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_demo/model/user.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class ApiServices{
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;


  /// GET API CALL

  @GET('users')
  Future<List<Data>> getData();

  @GET('users?id={id}')
  Future<List<Data>> getSpecificData(@Path("id") int id);

  ///POST API CALL
  @POST('users')
  Future postData(Map<String, String>? map);


}


