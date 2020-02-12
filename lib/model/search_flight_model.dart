class SearchFlightModel{
  String _img;
  String _addArrival;
  String _addDepature;
  String _arrivalDate;
  String _depatureDate;
  String _price;

  SearchFlightModel(this._img,this._addArrival,this._addDepature,this._arrivalDate,this._depatureDate,this._price);


  String get img=>_img;
  String get addArrival=>_addArrival;
  String get addDepature=>_addDepature;
  String get arrivalDate=>_arrivalDate;
  String get depatureDate=>_depatureDate;
  String get price=>_price;

}