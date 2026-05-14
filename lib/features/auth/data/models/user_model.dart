import '../../domain/entities/user_entity.dart';
class UserModel extends UserEntity {
  const UserModel({required super.id, required super.name, required super.email});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(id: int.tryParse(json['id'].toString()) ?? 0, name: json['name']?.toString() ?? '-', email: json['email']?.toString() ?? '-');
}
