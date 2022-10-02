class shopUserDatamodel
{
  late bool status;
  userdatashop? data;
  shopUserDatamodel.fromJson(Map<String,dynamic> json)
  {
    this.status=json['status'];

    this.data = json['data'] != null ? userdatashop.fromJson(json['data']) : null;

  }
}
class userdatashop {
  int ?id;
  String ?name;
  String ?email;
  String? phone;
  String ?image;
  int ?points;
  int ?credit;
  String ?token;

  userdatashop.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}