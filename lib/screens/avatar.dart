class Avatar {
  String? photo = '';

  Avatar({this.photo = 'images/collarAvatar.jpg'});

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo': photo,
    };
  }
}
