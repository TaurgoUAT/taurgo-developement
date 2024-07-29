class PropertyDetailsDto {
  final String address;
  final String areaCode;
  final String postalCode;

  PropertyDetailsDto({
    required this.address,
    required this.areaCode,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'areaCode': areaCode,
      'postalCode': postalCode,
    };
  }
}
