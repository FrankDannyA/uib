import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uib/core/models/activity.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://www.boredapi.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('activity')
  Future<Activity> getTasks();
}
