import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import 'post_list_status.dart';
part 'post_list_event.dart';
part 'post_list_state.dart';
class PostListBloc extends Bloc<PostListEvent, PostListState> { final GetPostsUseCase getPostsUseCase; static const int _limit=10; PostListBloc({required this.getPostsUseCase}) : super(const PostListState()) { on<PostListFetched>(_onFetched); on<PostListRefreshed>(_onRefreshed); }
  FutureOr<void> _onFetched(PostListFetched event, Emitter<PostListState> emit) async { if(state.hasReachedMax||state.status==PostListStatus.loading||state.status==PostListStatus.loadingMore) return; final isInitial=state.posts.isEmpty; emit(state.copyWith(status:isInitial?PostListStatus.loading:PostListStatus.loadingMore, clearError:true)); final result=await getPostsUseCase(start:state.posts.length, limit:_limit); result.when(success:(posts)=>emit(state.copyWith(status:PostListStatus.success, posts:[...state.posts,...posts], hasReachedMax:posts.length<_limit, clearError:true)), failure:(failure)=>emit(state.copyWith(status:PostListStatus.failure, error:failure))); }
  FutureOr<void> _onRefreshed(PostListRefreshed event, Emitter<PostListState> emit) async { emit(state.copyWith(status:PostListStatus.loading, posts:const [], hasReachedMax:false, clearError:true)); final result=await getPostsUseCase(start:0, limit:_limit); result.when(success:(posts)=>emit(state.copyWith(status:PostListStatus.success, posts:posts, hasReachedMax:posts.length<_limit, clearError:true)), failure:(failure)=>emit(state.copyWith(status:PostListStatus.failure, error:failure))); }
}
