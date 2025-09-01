class ProductModal{
  int? id;
  String?title;
  String? price;
  String?description;
  String?category;
  String?image;

  ProductModal(this.id,this.title,this.price,this.description,this.category,this.image);

 static ProductModal jsonModal(Map<String,dynamic> data){
       return ProductModal(data["id"], data["title"], data["price"].toString(), data["description"], data["category"],data["image"]);
     }
}
