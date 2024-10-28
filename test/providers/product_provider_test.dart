import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teko_hiring/providers/product_provider.dart';
import 'package:teko_hiring/services/api_service.dart';

// Giả lập (mock) ApiService để không cần gọi API thực
class MockApiService extends Mock implements ApiService {
  @override
  Future<Map<String, dynamic>> fetchProducts() =>
      super.noSuchMethod(Invocation.method(#fetchProducts, []),
          returnValue: Future.value(<String, dynamic>{}),
          returnValueForMissingStub: Future.value(<String, dynamic>{}));
}

void main() {
  group('ProductProvider Tests', () {
    late ProductProvider productProvider;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      productProvider = ProductProvider(apiService: mockApiService);
    });

    test(
        'fetchProducts should populate label, buttonText, formFields, and products',
        () async {
      when(mockApiService.fetchProducts())
          .thenAnswer((_) async => <String, dynamic>{
                'data': [
                  {
                    'type': 'Label',
                    'customAttributes': {
                      'label': {'text': 'Quản lý sản phẩm'}
                    }
                  },
                  {
                    'type': 'ProductSubmitForm',
                    'customAttributes': {
                      'form': [
                        {
                          'label': 'Tên sản phẩm',
                          'required': true,
                          'name': 'productName',
                          'type': 'text',
                          'maxLength': 20
                        },
                        {
                          'label': 'Giá sản phẩm',
                          'name': 'price',
                          'required': true,
                          'type': 'number',
                          'minValue': 10000,
                          'maxValue': 100000000
                        },
                        {
                          'name': 'imageUrl',
                          'label': 'URL ảnh',
                          'type': 'file_upload'
                        }
                      ]
                    }
                  },
                  {
                    'type': 'Button',
                    'customAttributes': {
                      'button': {'text': 'Tạo sản phẩm'}
                    }
                  },
                  {
                    'type': 'ProductList',
                    'customAttributes': {
                      'productlist': {
                        'items': [
                          {
                            'name': 'Sản phẩm 1',
                            'price': 100000,
                            'imageSrc': 'https://example.com/product1.jpg'
                          },
                          {
                            'name': 'Sản phẩm 2',
                            'price': 200000,
                            'imageSrc': 'https://example.com/product2.jpg'
                          }
                        ]
                      }
                    }
                  }
                ]
              });

      await productProvider.fetchProducts();

      expect(productProvider.label, 'Quản lý sản phẩm');

      expect(productProvider.buttonText, 'Tạo sản phẩm');

      expect(productProvider.products.length, 2);
      expect(productProvider.products[0].name, 'Sản phẩm 1');
      expect(productProvider.products[0].price, 100000);
      expect(productProvider.products[0].imageUrl,
          'https://example.com/product1.jpg');

      expect(productProvider.products[1].name, 'Sản phẩm 2');
      expect(productProvider.products[1].price, 200000);
      expect(productProvider.products[1].imageUrl,
          'https://example.com/product2.jpg');
    });
  });
}
