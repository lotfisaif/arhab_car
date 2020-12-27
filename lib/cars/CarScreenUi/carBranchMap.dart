import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarsBranchMap {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  CarsBranchMap(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<CarsBranchMap> carsBranchMap = [
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'صنعاء',
      description: '771244352084',
      locationCoords: LatLng(15.307021, 44.179092),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'المنصورة عدن',
      description: '771244352084',
      locationCoords: LatLng(12.853272, 44.988090),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'مدينة سيئون حضرموت',
      description: '771244352084',
      locationCoords: LatLng(15.946783, 48.784509),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'شارع جمال تعز',
      description: '771244352084',
      locationCoords: LatLng(13.574670, 44.021125),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'موري سقطرى',
      description: '771244352084',
      locationCoords: LatLng(12.618475, 53.949320),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no'),
  CarsBranchMap(
      shopName: ' سفر لتاجير السيارات',
      address: 'شارع جمال تعز',
      description: '771244352084',
      locationCoords: LatLng(13.574670, 44.021125),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
];
