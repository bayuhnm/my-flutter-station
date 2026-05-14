import '../../../../core/network/api_result.dart';
import '../entities/post_entity.dart';
abstract class PostRepository { Future<ApiResult<List<PostEntity>>> getPosts({required int start, required int limit}); }
