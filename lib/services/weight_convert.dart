class WeightConverter {
  Map getValues(double value, String unit) {
    Map units = {};
    double pound = 0.0, gram = 0.0, kilogram = 0.0, miligram = 0.0, uston = 0.0;
    switch (unit) {
      case "Gram":
        pound = value / 453.6;
        gram = value;
        kilogram = value / 1000;
        miligram = value * 1000;
        uston = value / 907200;
        break;
      case "Pound":
        pound = value;
        gram = value * 453.6;
        kilogram = value / 2.205;
        miligram = value * 453600;
        uston = value / 2000;
        break;
      case "Kilogram":
        pound = value * 2.205;
        gram = value * 1000;
        kilogram = value;
        miligram = value * 1000000;
        uston = value / 907.2;
        break;
      case "Miligram":
        pound = value / 453600;
        gram = value / 1000;
        kilogram = value / 1000000;
        miligram = value;
        uston = value / 9.072;
        break;

      case "Us ton":
        pound = value * 2000;
        gram = value * 907200;
        kilogram = value * 907.2;
        miligram = value * 9.072;
        uston = value;
        break;

      default:
    }
    units.addAll({
      "Gram": gram,
      "Kilogram": kilogram,
      "Pound": pound,
      "Us ton": uston,
      "Miligram": miligram
    });
    return units;
  }
}
