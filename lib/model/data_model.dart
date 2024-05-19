class PageModel{
  final int? page;
  final int? per_page;
  final int? total;
  final int? total_pages;
  final List<DataModel>? dataModel;
  final SupportModel? supportModel;

  PageModel({this.page, this.per_page, this.total, this.total_pages, this.dataModel, this.supportModel});

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
    page: json['page'],
    per_page: json['per_page'],
    total: json['total'],
    total_pages: json['total_pages'],
    dataModel: json['dataModel'],
    supportModel: json['supportModel']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'page':page,
    'per_page':per_page,
    'total':total,
    'total_pages':total_pages,
    'dataModel':dataModel,
    'supportModel':supportModel
  };

}

class DataModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  DataModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });


  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json['id'],
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    avatar: json['avatar']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'email' : email,
    'first_name' : firstName,
    'last_name' : lastName,
    'avatar' : avatar
  };

}


class SupportModel{
  final String? url;
  final String? text;

  SupportModel({this.url, this.text});

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
      url: json['url'],
      text: json['text'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'url':url,
    'text':text,
  };
}

/*{
  "page": 1,
  "per_page": 6,
  "total": 12,
  "total_pages": 2,
  "data": [
    {
      "id": 1,
      "email": "george.bluth@reqres.in",
      "first_name": "George",
      "last_name": "Bluth",
      "avatar": "https://reqres.in/img/faces/1-image.jpg"
    },
    {
      "id": 2,
      "email": "janet.weaver@reqres.in",
      "first_name": "Janet",
      "last_name": "Weaver",
      "avatar": "https://reqres.in/img/faces/2-image.jpg"
    },
    {
      "id": 3,
      "email": "emma.wong@reqres.in",
      "first_name": "Emma",
      "last_name": "Wong",
      "avatar": "https://reqres.in/img/faces/3-image.jpg"
    },
    {
      "id": 4,
      "email": "eve.holt@reqres.in",
      "first_name": "Eve",
      "last_name": "Holt",
      "avatar": "https://reqres.in/img/faces/4-image.jpg"
    },
    {
      "id": 5,
      "email": "charles.morris@reqres.in",
      "first_name": "Charles",
      "last_name": "Morris",
      "avatar": "https://reqres.in/img/faces/5-image.jpg"
    },
    {
      "id": 6,
      "email": "tracey.ramos@reqres.in",
      "first_name": "Tracey",
      "last_name": "Ramos",
      "avatar": "https://reqres.in/img/faces/6-image.jpg"
    }
  ],
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}*/