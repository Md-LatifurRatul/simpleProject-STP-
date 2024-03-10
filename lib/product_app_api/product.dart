class Product {
  String? id;
  String? productName;
  String? productCode;
  String? image;
  String? unitPrrice;
  String? quantity;
  String? totalPrice;
  String? createdDate;
  Product(
      {this.id,
      this.productCode,
      this.productName,
      this.image,
      this.unitPrrice,
      this.quantity,
      this.totalPrice,
      this.createdDate});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    image = json['Img'];
    unitPrrice = json['UnitPrice'];
    quantity = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    return {
      "Img": image,
      "ProductCode": productCode,
      "ProductName": productName,
      "Qty": quantity,
      "TotalPrice": totalPrice,
      "UnitPrice": unitPrrice,
      "_id": id,
    };
  }
}
