import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_result.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';
class PostRepositoryImpl implements PostRepository { final PostRemoteDataSource remoteDataSource; const PostRepositoryImpl({required this.remoteDataSource}); @override Future<ApiResult<List<PostEntity>>> getPosts({required int start, required int limit}) async { try { return ApiSuccess(await remoteDataSource.getPosts(start:start, limit:limit)); } on Failure catch(f){ return ApiFailure(f); } catch(e){ return ApiFailure(Failure.unknown(e)); } } }
