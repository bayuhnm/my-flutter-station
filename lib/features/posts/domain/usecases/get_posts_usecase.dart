import '../../../../core/network/api_result.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';
class GetPostsUseCase { final PostRepository repository; const GetPostsUseCase(this.repository); Future<ApiResult<List<PostEntity>>> call({required int start, required int limit}) => repository.getPosts(start:start, limit:limit); }
