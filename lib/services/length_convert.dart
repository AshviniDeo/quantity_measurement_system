class LengthConverter {
  Map getValues(double value, String unit) {
    Map units = {};
    double centi = 0.0;
    double meter = 0.0;
    double kilo = 0.0;
    double inch = 0.0;
    double foot = 0.0;
    double yard = 0.0;
    switch (unit) {
      case "KiloMeter":
        centi = value * 100000;
        kilo = value;
        meter = value * 1000;
        inch = value * 39370;
        foot = value * 3281;
        yard = value * 1094;
        break;
      case "Meter":
        centi = value * 100;
        kilo = value / 1000;
        meter = value;
        inch = value * 39.37;
        foot = value * 3.281;
        yard = value * 1.094;

        break;
      case "Centimeter":
        centi = value;
        kilo = value / 100000;
        meter = value / 100;
        inch = value / 2.54;
        foot = value / 30.48;
        yard = value / 91.44;
        break;
      case "Inch":
        centi = value * 2.54;
        kilo = value / 39370;
        meter = value / 39.37;
        inch = value;
        foot = value / 12;
        yard = value / 36;
        break;
      case "Foot":
        centi = value * 30.48;
        kilo = value / 3281;
        meter = value / 3.281;
        inch = value * 12;
        foot = value;
        yard = value / 3;
        break;
      case "Yard":
        centi = value * 91.44;
        kilo = value / 1094;
        meter = value / 1.094;
        inch = value * 36;
        foot = value * 3;
        yard = value;
        break;
      default:
    }
    units = {
      "Kilometer": kilo,
      "Meter": meter,
      "Centimeter": centi,
      "Inch": inch,
      "Yard": yard,
      "Foot": foot
    };
    return units;
  }
}
