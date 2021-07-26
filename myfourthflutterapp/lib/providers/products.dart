import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: '농심 배흥동 비빔면, 32개입',
      description: '엄청 시원한 비빔면 존맛탱임!',
      price: 19020,
      imageUrl:
          'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/255828096400583-70f3975f-3357-4101-bf29-d1dbc7bf94d8.jpg',
    ),
    Product(
      id: 'p2',
      title: '농심 짬뽕건면, 32개입',
      description: '이것이 짬뽕인가 짜장인가 모르겠네',
      price: 20300,
      imageUrl:
          'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/xlezetna/983616a9d6cb4879b8ec897b0f190912.jpg',
    ),
    Product(
      id: 'p3',
      title: '신라면 블랙 두부김치, 4개입',
      description: '히트상품 신라면 블랙의 후속작!',
      price: 3800,
      imageUrl:
          'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/11/16/18/8/c199d767-22d4-4d94-9df7-8757f5db3d34.jpg',
    ),
    Product(
      id: 'p4',
      title: '아몬드브리즈 뉴트리 식이섬유',
      description: '다이어트 드가자',
      price: 15480,
      imageUrl:
          'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/10/22/17/8/e705de8a-ec4c-4cfd-a38f-42afc47215df.jpg',
    ),
    Product(
      id: 'p5',
      title: '프레시지 더큰 햄가득 부대전골',
      description: '집에서 해먹는 간편 부대찌개!',
      price: 10900,
      imageUrl:
          'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/06/18/12/9/9f4cd406-34aa-4e3e-ba20-2c5ebeff0234.jpg',
    ),
    Product(
      id: 'p6',
      title: '미트포유 옛날 삼겹살',
      description: '다이어트 나가자',
      price: 14900,
      imageUrl:
          'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/10/21/16/3/88432c7e-584a-4748-9db2-9760f8080ac3.jpg',
    ),
    Product(
        id: 'p7',
        title: '판토텐산 B5',
        description: '여드름 전용인가?',
        price: 9330,
        imageUrl:
            'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/images/2019/03/20/13/1/57ecf457-bb41-4ba8-9b65-63597c024cee.jpg'),
    Product(
        id: 'p8',
        title: '퀴멸의 칼날 히노카미',
        description: '귀칼 유행이라며',
        price: 125000,
        imageUrl:
            'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2021/07/13/10/4/12387f17-6f35-488c-876f-8296bd727d7c.jpg'),
    Product(
      id: 'p9',
      title: '홈플래닛 스마트 체지방 측정기',
      description: '다이어트 드가자',
      price: 13660,
      imageUrl:
          'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/519187041074607-0c17571c-5e95-469e-a940-99b2883aa25b.jpg',
    ),
    Product(
        id: 'p10',
        title: '샤오미 LCD 드로잉 테이블',
        description: '그림이 너무 좋아',
        price: 22950,
        imageUrl:
            'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/11/04/10/5/8b59da3d-c676-4529-986d-6969690a6733.jpg'),
    Product(
        id: 'p11',
        title: '닌텐도 스위치 퍼펙트 슈퍼볼',
        description: '곧 품절예상!',
        price: 38000,
        imageUrl:
            'https://thumbnail7.coupangcdn.com/thumbnails/remote/300x300ex/image/retail/images/2021/07/14/10/8/311f8e83-9b5f-4fbb-9bda-50c74560bc08.jpg'),
    Product(
        id: 'p12',
        title: 'Apple 정품 USB-C 케이블',
        description: '정품 케이블',
        price: 19500,
        imageUrl:
            'https://thumbnail10.coupangcdn.com/thumbnails/remote/300x300ex/image/retail/images/330677074620956-bc96f542-d67b-45d7-91ae-f91d39b59f5b.jpg'),
    Product(
        id: 'p13',
        title: '애플워치 SE, GPS',
        description: '2021년 최신형',
        price: 345900,
        imageUrl:
            'https://thumbnail7.coupangcdn.com/thumbnails/remote/300x300ex/image/retail/images/7696374737960-06c26f91-d1ad-45c8-bf34-39ee275d068a.jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((productItem) => productItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

// void showFavoritesOnly() {
//   _showFavoritesOnly = true;
//   notifyListeners();
// }
//
// void showAll() {
//   _showFavoritesOnly = false;
//   notifyListeners();
// }
//
  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
