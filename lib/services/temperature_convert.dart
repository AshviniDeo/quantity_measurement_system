class TemperatureConverter {
  Map getValues(double value, String unit) {
    Map units = {};
    double farhenite = 0.0;
    double celcius = 0.0;
    double kelvin = 0.0;

    switch (unit) {
      case "Fahrenite":
        celcius = (value - 32) * 5 / 9;
        farhenite = value;
        kelvin = (value - 32) * 5 / 9 + 273.15;
        break;
      case "Celcius":
        celcius = value;
        farhenite = (value * 9 / 5) + 32;
        kelvin = value + 273.15;
        break;
      case "Kelvin":
        celcius = value - 273.15;
        farhenite = (value - 273.15) * 9 / 5 + 32;
        kelvin = value;
        break;
      default:
    }
    units = {"Fahrenite": farhenite, "Celcius": celcius, "Kelvin": kelvin};
    return units;
  }
}
