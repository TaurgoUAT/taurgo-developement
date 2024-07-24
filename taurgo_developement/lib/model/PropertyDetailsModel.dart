import 'package:flutter/foundation.dart';

class PropertyDetailsModel {
  final String id;
  final String name;
  final String type;
  final String? imageUrl; // Use nullable type
  final DateTime? uploadDate;
  final String? filePath; // Use nullable type
  final int size;
  final String address;
  final String areaCode;
  final String postalCode;

  PropertyDetailsModel({
    required this.id,
    required this.name,
    required this.type,
    this.imageUrl, // Mark as optional
    this.uploadDate,
    this.filePath,
    required this.size,
    required this.address,
    required this.areaCode,
    required this.postalCode,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
      id: json['_id'] as String? ?? '', // Provide default value
      name: json['name'] as String? ?? 'Unknown Name',
      type: json['type'] as String? ?? 'Unknown Type',
      imageUrl: json['imageUrl'] as String?, // Nullable assignment
      uploadDate: json['uploadDate'] != null ? DateTime.parse(json['uploadDate'] as String) : null,
      filePath: json['filePath'] as String?, // Nullable assignment
      size: json['size'] as int? ?? 0,
      address: json['address'] as String? ?? 'Unknown Address',
      areaCode: json['areaCode'] as String? ?? 'Unknown Area Code',
      postalCode: json['postalCode'] as String? ?? 'Unknown Postal Code',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'uploadDate': uploadDate?.toIso8601String(),
      'filePath': filePath,
      'size': size,
      'address': address,
      'areaCode': areaCode,
      'postalCode': postalCode,
    };
  }
}
