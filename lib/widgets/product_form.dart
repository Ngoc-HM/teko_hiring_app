import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedImage != null) {
      final newProduct = Product(
        name: _nameController.text,
        price: double.parse(_priceController.text),
        imageUrl: _selectedImage!.path, // Lưu đường dẫn ảnh trong album
      );

      Provider.of<ProductProvider>(context, listen: false)
          .addProduct(newProduct);

      _nameController.clear();
      _priceController.clear();
      setState(() {
        _selectedImage = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn ảnh cho sản phẩm')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Thêm sản phẩm", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Tên sản phẩm',
                  hintText: 'Nhập tên sản phẩm',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên sản phẩm';
                  } else if (value.length > 20) {
                    return 'Tên sản phẩm không được quá 20 ký tự';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Giá sản phẩm',
                  hintText: 'Nhập giá sản phẩm',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập giá sản phẩm';
                  }
                  final price = double.tryParse(value);
                  if (price == null || price < 10000 || price > 100000000) {
                    return 'Giá sản phẩm phải từ 10,000 đến 100,000,000';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Row(),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Tạo sản phẩm',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
