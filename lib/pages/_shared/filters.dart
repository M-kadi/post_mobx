enum Filters {
  DateFrom,
  DateTo,
  CustomerID,
  ProductType,
  CurrencyID
}

extension CatExtension on Filters {

  String get name {
    switch (this) {
      case Filters.DateFrom:
        return 'DateFrom';
      case Filters.DateTo:
        return 'DateTo';
      case Filters.CustomerID:
        return 'CustomerID';
      case Filters.ProductType:
        return 'ProductType';
      case Filters.CurrencyID:
        return 'CurrencyID';

      default:
        return '';
    }
  }
}