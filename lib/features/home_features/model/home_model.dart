class HomeModel {
  HomeModel({
      this.page, 
      this.perPage, 
      this.totalItems, 
      this.totalPages, 
      this.items,});

  HomeModel.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['perPage'] = perPage;
    map['totalItems'] = totalItems;
    map['totalPages'] = totalPages;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.collectionId, 
      this.collectionName, 
      this.created, 
      this.foodCalery, 
      this.foodIngredients, 
      this.foodName, 
      this.id, 
      this.imageFile, 
      this.imageUrl, 
      this.typeOfFood, 
      this.updated,});

  Items.fromJson(dynamic json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    foodCalery = json['food_calery'];
    foodIngredients = json['food_ingredients'];
    foodName = json['food_name'];
    id = json['id'];
    imageFile = json['imageFile'];
    imageUrl = json['imageUrl'];
    typeOfFood = json['typeOf_food'];
    updated = json['updated'];
  }
  String? collectionId;
  String? collectionName;
  String? created;
  String? foodCalery;
  String? foodIngredients;
  String? foodName;
  String? id;
  String? imageFile;
  String? imageUrl;
  String? typeOfFood;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionId'] = collectionId;
    map['collectionName'] = collectionName;
    map['created'] = created;
    map['food_calery'] = foodCalery;
    map['food_ingredients'] = foodIngredients;
    map['food_name'] = foodName;
    map['id'] = id;
    map['imageFile'] = imageFile;
    map['imageUrl'] = imageUrl;
    map['typeOf_food'] = typeOfFood;
    map['updated'] = updated;
    return map;
  }

}