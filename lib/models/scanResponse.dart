class scanResponse {
  String objectName;

  scanResponse({required this.objectName});
  
  factory scanResponse.fromJson(Map<String, dynamic> json) {
    return scanResponse(
      objectName: json['name'],
    );
  }

}
