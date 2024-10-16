import 'package:big_cart/data/network/base_api_services.dart';
import 'package:big_cart/data/network/network_api_services.dart';
import 'package:big_cart/model/user/user_model.dart';
import 'package:big_cart/configs/app_url.dart';
import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  @override
  Future<UserModel> loginApi(dynamic data )async{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response) ;
  }


}