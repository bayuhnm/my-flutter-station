import '../../../../core/errors/failure.dart';
import '../../../../core/network/core_api_service.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource { Future<List<PostModel>> getPosts({required int start, required int limit}); }
class PostRemoteDataSourceImpl implements PostRemoteDataSource { final CoreApiService apiService; PostRemoteDataSourceImpl({required this.apiService});
  @override Future<List<PostModel>> getPosts({required int start, required int limit}) async { final result=await apiService.get('/posts', queryParameters:{'_start':start,'_limit':limit}, requiredToken:false); return result.when(success:(response){ final data=response.data; if(data is List){ return data.whereType<Map<String,dynamic>>().map(PostModel.fromJson).toList(); } throw const Failure(title:'Invalid Response', message:'Posts response format is invalid.'); }, failure:(failure)=>throw failure); }
}
