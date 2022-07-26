// add DashboardType customers, items ... : for on click action
enum DashboardType {
  users,
  settings,
}

extension ParseToString on DashboardType {
  String toStr() {
    return this.toString().split('.').last;
  }
}

DashboardType DashboardTypeFromStr(val) {
  for (DashboardType type in DashboardType.values) {
    if (val == type.toStr())
      return type;
  }
  return DashboardType.users;
}

// add content_home_screen - Dashboard
class ContentHome {
  String id = "", title = "", value = "" , img = "", imgDark = "", type = "";

  ContentHome({required this.id, required this.title, required this.value, required this.img, required this.imgDark, required this.type});

  ContentHome.init() {
    id = "";
    title = "";
    value = "";
    img = "";
    imgDark = "";
    type = "";
  }

  factory ContentHome.fromJSON(Map<String, dynamic> json) => get(json);

  static ContentHome fromJson2(json) => get(json);

  static ContentHome get(json) => ContentHome(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      img: json['img'] ?? '',
      imgDark: json['imgDark'] ?? '',
      type: json['type'] ?? '',
  );

  static List<ContentHome> fromJsonList(List<dynamic> json) => json.map((i) => ContentHome.fromJson(i)).toList();

  ContentHome.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    value = json['value'];
    img = json['img'];
    imgDark = json['imgDark'];
    type = json['type'];
  }
}