import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/post_list_bloc.dart';
import '../bloc/post_list_status.dart';
import '../widgets/post_card.dart';
import '../widgets/post_list_skeleton.dart';

class PostListPage extends StatefulWidget { const PostListPage({super.key}); @override State<PostListPage> createState() => _PostListPageState(); }

class _PostListPageState extends State<PostListPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() { super.initState(); _scrollController.addListener(_onScroll); final bloc = context.read<PostListBloc>(); if (bloc.state.posts.isEmpty) bloc.add(const PostListFetched()); }
  @override
  void dispose() { _scrollController.removeListener(_onScroll); _scrollController.dispose(); super.dispose(); }
  void _onScroll() { if (!_scrollController.hasClients) return; if (_scrollController.offset >= _scrollController.position.maxScrollExtent * 0.82) context.read<PostListBloc>().add(const PostListFetched()); }
  Future<void> _onRefresh() async => context.read<PostListBloc>().add(const PostListRefreshed());

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GlassAppBar(title: 'Explore Posts', actions: [IconButton(onPressed: _onRefresh, icon: const Icon(Icons.refresh_rounded))]),
        body: Column(children: [
          const _Header(),
          Expanded(child: BlocBuilder<PostListBloc, PostListState>(builder: (context, state) {
            if (state.isInitialLoading && state.posts.isEmpty) return const PostListSkeleton();
            if (state.hasFailure && state.posts.isEmpty) return _ErrorState(message: state.error?.message ?? 'Failed to load posts.', onRetry: () => context.read<PostListBloc>().add(const PostListFetched()));
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                itemCount: state.posts.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.posts.length) {
                    if (state.hasReachedMax) return const _EndOfList();
                    if (state.status == PostListStatus.failure) return _LoadMoreError(message: state.error?.message ?? 'Failed to load more.', onRetry: () => context.read<PostListBloc>().add(const PostListFetched()));
                    return const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Center(child: CircularProgressIndicator()));
                  }
                  return PostCard(post: state.posts[index], index: index);
                },
              ),
            );
          })),
        ]),
      ),
    );
  }
}

class _Header extends StatelessWidget { const _Header(); @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 8), child: GlassCard(borderRadius: 32, padding: const EdgeInsets.all(20), gradientColors: [Colors.white.withOpacity(0.20), const Color(0xFFAEC2FF).withOpacity(0.07), Colors.white.withOpacity(0.055)], child: Row(children: [Container(width: 56, height: 56, decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), gradient: LinearGradient(colors: [Colors.white.withOpacity(0.88), const Color(0xFFAEC2FF).withOpacity(0.64)])), child: const Icon(Icons.dynamic_feed_rounded, color: Color(0xFF111827))), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const GlassPill(text: 'PUBLIC API'), const SizedBox(height: 10), const Text('Infinite Scroll Feed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.3)), const SizedBox(height: 5), Text('Loaded from JSONPlaceholder.', style: TextStyle(height: 1.35, color: Colors.white.withOpacity(0.64), fontWeight: FontWeight.w600))]))]))); }

class _ErrorState extends StatelessWidget { final String message; final VoidCallback onRetry; const _ErrorState({required this.message, required this.onRetry}); @override Widget build(BuildContext context) => Center(child: Padding(padding: const EdgeInsets.all(28), child: GlassCard(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.cloud_off_rounded, size: 54), const SizedBox(height: 16), const Text('Unable to load posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text(message, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.65))), const SizedBox(height: 18), FilledButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh_rounded), label: const Text('Try Again'))])))); }
class _LoadMoreError extends StatelessWidget { final String message; final VoidCallback onRetry; const _LoadMoreError({required this.message, required this.onRetry}); @override Widget build(BuildContext context) => GlassCard(margin: const EdgeInsets.only(top: 4, bottom: 20), padding: const EdgeInsets.all(16), borderRadius: 22, gradientColors: [Colors.redAccent.withOpacity(0.18), Colors.white.withOpacity(0.05)], child: Row(children: [const Icon(Icons.error_outline_rounded), const SizedBox(width: 12), Expanded(child: Text(message)), TextButton(onPressed: onRetry, child: const Text('Retry'))])); }
class _EndOfList extends StatelessWidget { const _EndOfList(); @override Widget build(BuildContext context) => const Padding(padding: EdgeInsets.only(top: 8, bottom: 28), child: Center(child: GlassPill(text: 'YOU HAVE REACHED THE END', icon: Icons.check_circle_outline_rounded))); }
