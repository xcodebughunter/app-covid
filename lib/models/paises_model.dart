// To parse this JSON data, do
//
//     final paisesModel = paisesModelFromJson(jsonString);

import 'dart:convert';


Pais paisFromJson(String str) => Pais.fromJson(json.decode(str));

String paisToJson(Pais data) => json.encode(data.toJson());

class Paises {

  List<Country> items = new List();

  Paises();

  Paises.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final pais = new Country.fromJson(item);
      items.add( pais );
    }

  }

}

class Pais {
    Global global;
    List<Country> countries;

    Pais({
        this.global,
        this.countries,
    });

    factory Pais.fromJson(Map<String, dynamic> json) => Pais(
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Global": global.toJson(),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class Country {
    String country;
    String countryCode;
    String slug;
    int newConfirmed;
    int totalConfirmed;
    int newDeaths;
    int totalDeaths;
    int newRecovered;
    int totalRecovered;
    DateTime date;

    Country({
        this.country,
        this.countryCode,
        this.slug,
        this.newConfirmed,
        this.totalConfirmed,
        this.newDeaths,
        this.totalDeaths,
        this.newRecovered,
        this.totalRecovered,
        this.date,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json["Country"],
        countryCode: json["CountryCode"],
        slug: json["Slug"],
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
    );

    Map<String, dynamic> toJson() => {
        "Country": country,
        "CountryCode": countryCode,
        "Slug": slug,
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
        "Date": date.toIso8601String(),
    };
}

class Global {
    int newConfirmed;
    int totalConfirmed;
    int newDeaths;
    int totalDeaths;
    int newRecovered;
    int totalRecovered;

    Global({
        this.newConfirmed,
        this.totalConfirmed,
        this.newDeaths,
        this.totalDeaths,
        this.newRecovered,
        this.totalRecovered,
    });

    factory Global.fromJson(Map<String, dynamic> json) => Global(
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
    );

    Map<String, dynamic> toJson() => {
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
    };
}
