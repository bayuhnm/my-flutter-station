import 'package:equatable/equatable.dart';
class PostEntity extends Equatable { final int userId,id; final String title,body; const PostEntity({required this.userId, required this.id, required this.title, required this.body}); String get shortTitle => title.isEmpty ? '-' : '${title[0].toUpperCase()}${title.substring(1)}'; @override List<Object?> get props=>[userId,id,title,body]; }
