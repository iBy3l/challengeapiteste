class UserModel {
  String login;
  int id;
  String nodeId;
  String avatarUrl;

  UserModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;

    return data;
  }
}
