
import 'package:reflectus2/api_service/api_service.dart';
import 'package:reflectus2/core/base_controllers/load_data_controller.dart';

class CommunityController extends LoadDataController<List<String>>{
  @override
  Future<List<String>> callApi() => ApiService.getAllMessages();

}