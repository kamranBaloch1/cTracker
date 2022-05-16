class countryModel {
  late final int updated;
  late final String country;
  late final CountryInfo countryInfo;
  late final int cases;
  late final int todayCases;
  late final int deaths;
  late final int todayDeaths;
  late final int recovered;
  late final int todayRecovered;
  late final int active;
  late final int critical;
  late final int casesPerOneMillion;
  late final int deathsPerOneMillion;
  late final int tests;
  late final int testsPerOneMillion;
  late final int population;
  late final String continent;
  late final int oneCasePerPeople;
  late final int oneDeathPerPeople;
  late final int oneTestPerPeople;
  late final double activePerOneMillion;
  late final double recoveredPerOneMillion;
  late final double criticalPerOneMillion;

  countryModel(
      {required this.updated,
      required this.country,
      required this.countryInfo,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.casesPerOneMillion,
      required this.deathsPerOneMillion,
      required this.tests,
      required this.testsPerOneMillion,
      required this.population,
      required this.continent,
      required this.oneCasePerPeople,
      required this.oneDeathPerPeople,
      required this.oneTestPerPeople,
      required this.activePerOneMillion,
      required this.recoveredPerOneMillion,
      required this.criticalPerOneMillion});

  countryModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = (json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null)!;
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    continent = json['continent'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo.toJson();
    }
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['todayRecovered'] = this.todayRecovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['tests'] = this.tests;
    data['testsPerOneMillion'] = this.testsPerOneMillion;
    data['population'] = this.population;
    data['continent'] = this.continent;
    data['oneCasePerPeople'] = this.oneCasePerPeople;
    data['oneDeathPerPeople'] = this.oneDeathPerPeople;
    data['oneTestPerPeople'] = this.oneTestPerPeople;
    data['activePerOneMillion'] = this.activePerOneMillion;
    data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this.criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  late final int iId;
  late final String iso2;
  late final String iso3;
  late final int lat;
  late final int long;
  late final String flag;

  CountryInfo(
      {required this.iId,
      required this.iso2,
      required this.iso3,
      required this.lat,
      required this.long,
      required this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['flag'] = this.flag;
    return data;
  }
}
