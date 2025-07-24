import 'dart:convert';

class WheatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WheatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Map<String, dynamic> toMap() {
    return {
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'clouds': clouds?.toMap(),
      'dt': dt,
      'sys': sys?.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory WheatherModel.fromMap(Map<String, dynamic> map) {
    return WheatherModel(
      coord: map['coord'] != null ? Coord.fromMap(map['coord']) : null,
      weather:
          map['weather'] != null
              ? List<Weather>.from(
                map['weather']?.map((x) => Weather.fromMap(x)),
              )
              : null,
      base: map['base'],
      main: map['main'] != null ? Main.fromMap(map['main']) : null,
      visibility: map['visibility']?.toInt(),
      wind: map['wind'] != null ? Wind.fromMap(map['wind']) : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds']) : null,
      dt: map['dt']?.toInt(),
      sys: map['sys'] != null ? Sys.fromMap(map['sys']) : null,
      timezone: map['timezone']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      cod: map['cod']?.toInt(),
    );
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Map<String, dynamic> toMap() {
    return {'all': all};
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(all: map['all']?.toInt());
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Map<String, dynamic> toMap() {
    return {'lon': lon, 'lat': lat};
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(lon: map['lon']?.toDouble(), lat: map['lat']?.toDouble());
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble(),
      feelsLike: map['feels_like']?.toDouble(),
      tempMin: map['temp_min']?.toDouble(),
      tempMax: map['temp_max']?.toDouble(),
      pressure: map['pressure']?.toInt(),
      humidity: map['humidity']?.toInt(),
      seaLevel: map['sea_level']?.toInt(),
      grndLevel: map['grnd_level']?.toInt(),
    );
  }
}

class Sys {
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Map<String, dynamic> toMap() {
    return {'country': country, 'sunrise': sunrise, 'sunset': sunset};
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      country: map['country'],
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
    );
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Map<String, dynamic> toMap() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Map<String, dynamic> toMap() {
    return {'speed': speed, 'deg': deg, 'gust': gust};
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble(),
      deg: map['deg']?.toInt(),
      gust: map['gust']?.toDouble(),
    );
  }
}
