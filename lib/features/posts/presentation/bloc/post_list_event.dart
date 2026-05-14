part of 'post_list_bloc.dart';
sealed class PostListEvent extends Equatable { const PostListEvent(); @override List<Object?> get props=>[]; }
class PostListFetched extends PostListEvent { const PostListFetched(); }
class PostListRefreshed extends PostListEvent { const PostListRefreshed(); }
