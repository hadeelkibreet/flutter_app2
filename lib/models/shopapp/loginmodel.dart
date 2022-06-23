class shoploginmodel
{
  late bool status;
  late String  message;
  late userdatashop data;
  shoploginmodel.fromJson(Map<String,dynamic> json)
  {
    this.status=json['status'];
    this.message=json['message'];
    this.data = (json['data'] != null? userdatashop.fromJson(json['data']):null)!;
  }
}
class userdatashop{
  int ?id;
  String ?name;
  String ?email;
  String? phone;
  String ?image;
  int ?points;
  int ?credit;
  String ?token;

  userdatashop.fromJson(Map<String,dynamic> json)
  {
    id =  json['id'];
    name =  json['name'];
    email =  json['email'];
    phone =  json['phone'];
    image =  json['image'];
    points =  json['points'];
    credit =  json['credit'];
    token =  json['token'];


  }
// userdatashop({
//   required this.id,
//   required this.email,
//   required this.name,
//   required this.image,
//   required this.phone,
//   required this.credit,
//   required this.points,
//   required this.token,
//
// });



}
//
//
// this.id =  json['id'];
//    name =  json['name'];
//    email =  json['email'];
//    phone =  json['phone'];
//    image =  json['image'];
//    credit =  json['credit'];
//    token =  json['token'];


//
//class shoploginmodel {
//  shoploginmodel({
//    required this.info,
//    required this.item,
//    required this.event,
//    required this.variable,
//  });
//  late final Info info;
//  late final List<Item> item;
//  late final List<Event> event;
//  late final List<Variable> variable;
//
//  shoploginmodel.fromJson(Map<String, dynamic> json){
//    info = Info.fromJson(json['info']);
//    item = List.from(json['item']).map((e)=>Item.fromJson(e)).toList();
//    event = List.from(json['event']).map((e)=>Event.fromJson(e)).toList();
//    variable = List.from(json['variable']).map((e)=>Variable.fromJson(e)).toList();
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['info'] = info.toJson();
//    _data['item'] = item.map((e)=>e.toJson()).toList();
//    _data['event'] = event.map((e)=>e.toJson()).toList();
//    _data['variable'] = variable.map((e)=>e.toJson()).toList();
//    return _data;
//  }
//}
//
//class Info {
//  Info({
//    required this.postmanId,
//    required this.name,
//    required this.schema,
//  });
//  late final String postmanId;
//  late final String name;
//  late final String schema;
//
//  Info.fromJson(Map<String, dynamic> json){
//    postmanId = json['_postman_id'];
//    name = json['name'];
//    schema = json['schema'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['_postman_id'] = postmanId;
//    _data['name'] = name;
//    _data['schema'] = schema;
//    return _data;
//  }
//}
//
//class Item {
//  Item({
//    required this.name,
//    required this.item,
//    required this.id,
//  });
//  late final String name;
//  late final List<Item> item;
//  late final String id;
//
//  Item.fromJson(Map<String, dynamic> json){
//    name = json['name'];
//    item = List.from(json['item']).map((e)=>Item.fromJson(e)).toList();
//    id = json['id'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['name'] = name;
//    _data['item'] = item.map((e)=>e.toJson()).toList();
//    _data['id'] = id;
//    return _data;
//  }
//}
//
//class Event {
//  Event({
//    required this.listen,
//    required this.script,
//  });
//  late final String listen;
//  late final Script script;
//
//  Event.fromJson(Map<String, dynamic> json){
//    listen = json['listen'];
//    script = Script.fromJson(json['script']);
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['listen'] = listen;
//    _data['script'] = script.toJson();
//    return _data;
//  }
//}
//
//class Script {
//  Script({
//    required this.id,
//    required this.type,
//    required this.exec,
//  });
//  late final String id;
//  late final String type;
//  late final List<String> exec;
//
//  Script.fromJson(Map<String, dynamic> json){
//    id = json['id'];
//    type = json['type'];
//    exec = List.castFrom<dynamic, String>(json['exec']);
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['id'] = id;
//    _data['type'] = type;
//    _data['exec'] = exec;
//    return _data;
//  }
//}
//
//class Variable {
//  Variable({
//    required this.id,
//    required this.key,
//    required this.value,
//  });
//  late final String id;
//  late final String key;
//  late final String value;
//
//  Variable.fromJson(Map<String, dynamic> json){
//    id = json['id'];
//    key = json['key'];
//    value = json['value'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final _data = <String, dynamic>{};
//    _data['id'] = id;
//    _data['key'] = key;
//    _data['value'] = value;
//    return _data;
//  }
//}

