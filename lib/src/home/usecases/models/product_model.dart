import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class ProductModel extends AppModel<ProductModel> {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageList,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return ProductModel.empty();
    }
    return ProductModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      imageList: List<String>.from(map['imageList'] as List<String>),
      description: map['description'] as String? ?? '',
      category: map['category'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  factory ProductModel.fromResponse(ProductResponse response) {
    return ProductModel(
      id: response.productId,
      name: response.name,
      price: response.price,
      imageList: response.imageList,
      description: response.description,
      category: response.category,
      rating: response.rating,
    );
  }

  factory ProductModel.empty() {
    return ProductModel(
      id: '0',
      name: '',
      price: 0,
      imageList: [],
      description: '',
      category: '',
      rating: 0,
    );
  }

  factory ProductModel.mock() {
    return ProductModel(
      id: '0',
      name:
          '''JUNMAMลด100⚡GW⚡9655 กางเกงขาสั้น ผู้ชาย ผ้ายืด สีพื้น ยาว 20-21 นิ้ว ไซส์ 28-44 Goodwin Brand''',
      price: 390,
      imageList: [
        'https://cf.shopee.co.th/file/490007dccba21de53046769725a1b416',
        'https://cf.shopee.co.th/file/8a16c9dc27b899dfa44b47e39dcf1f7d',
      ],
      description: '''
GW⚡9655 กางเกงขาสั้น ผู้ชาย ผ้ายืด สีพื้น ยาว 20-21 นิ้ว ไซส์ 28-36 Goodwin Brand

👖Item code : 9655
Size :  28 - 30 - 32 - 34 - 36 - 38 - 40 - 42 - 44 ( รอบเอว/หน่วยนิ้ว )
Color :  22เทาเข้ม , 7เทา , 9กรม , 5ขี้ม้า , 10ดำ
Brand : Goodwin
MADE IN THAILAND

✨Feature
🔸ผ้ายืด Spandex ผ้านุ่มลื่น Cotton 97% Spandex 3% ใส่สบายทั้งวัน  เพิ่มกระบวนการ Lafer Peace ทำให้ผ้านุ่ม x2
🔸ทรงสวย ความยาว 20-21 นิ้ว ใส่สบายชิวๆ
🔸ใช้ซิปโลหะอย่างดี แข็งแรงทนทาน
🔸กระเป๋าลับตกแต่งด้วยลายสกรีนสุดชิค ด้วยเทคนิคสกรีน แบบ 2-Layer
🔸ผ้าผ่านการฟอกนุ่ม สวมใส่สบาย รับประกันสีไม่ตก
🔸กระเป๋าลึก ใส่โทรศัพท์ได้สบาย ของไม่หล่น
🔸ฝีเข็มปราณีตสวยงาม เย็บย้ำกันขาดทุกจุด ใช้ทนแน่นอน
🔸ผลิตในไทย ไม่ใช่ของจีนจ้า การันตีคุณภาพมาเต็ม
🔸QC วัดไซส์ และคุณภาพทุกตัวก่อนจัดส่ง พร้อมจัดส่งสั่งได้เลยน้า ( ส่งทุกวัน จ.-ส. )

🔹แนะนำคุณลูกค้าเลือกตามรอบเอวจริงได้เลยจ้า ทุกรุ่นมีเป็นไซส์คู่ ถ้ารอบเอวไซส์คี่ เช่น 33 ให้+1นิ้ว = ไซส์34 จะพอดีน้า
🔹ซื้อไปแล้วใส่ไม่พอดีสามารถเปลี่ยนได้ภายใน 7 วัน ( ไม่ซัก ไม่แกะป้าย )
🔥🔥🔥เปลี่ยนฟรีครั้งแรกไม่มีค่าใช่จ่ายเพิ่ม🔥🔥🔥

รับผลิตและขายส่ง ติดต่อทางแชทได้เลยจ้า
    ''',
      category: 'Clothing',
      rating: 4.5,
    );
  }
  final String id;
  final String name;
  final double price;
  final List<String> imageList;
  final String description;
  final String category;
  final double rating;

  @override
  List<Object?> get props => [
        name,
        price,
        imageList,
        description,
        category,
        rating,
      ];

  @override
  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
    List<String>? imageList,
    String? description,
    String? category,
    double? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageList: imageList ?? this.imageList,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'imageList': imageList,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
