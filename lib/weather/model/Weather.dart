class Weather {
  bool isSuccessed;
  Basic basic;
  Update update;
  Now now;

  Weather.empty() {
    isSuccessed = false;
    basic = Basic.empty();
    update = Update.empty();
    now = Now.empty();
  }

  Weather.fromJson(Map<String, dynamic> json) {
    var jsonOb = json['HeWeather6'][0];
    isSuccessed = (jsonOb['status'] == 'ok' ? true : false);
    if (!isSuccessed) {
      Weather.empty();
      return;
    }

    basic = Basic.fromJson(jsonOb['basic']);
    update = Update.fromJson(jsonOb['update']);
    now = Now.fromJson(jsonOb['now']);
  }

  @override
  String toString() {
    return 'Weather{isSuccessed: $isSuccessed, basic: $basic, update: $update, now: $now}';
  }
}

class Basic {
  String cid;
  String location;
  String parent_city;
  String admin_area;
  String cnty;
  String lat;
  String lon;
  String tz;

  Basic(this.cid, this.location, this.parent_city, this.admin_area, this.cnty,
      this.lat, this.lon, this.tz);

  Basic.empty() : this("", "", "", "", "", "", "", "");

  Basic.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    location = json['location'];
    parent_city = json['parent_city'];
    admin_area = json['admin_area'];
    cnty = json['cnty'];
    lat = json['lat'];
    lon = json['lon'];
    tz = json['tz'];
  }

  @override
  String toString() {
    return 'Basic{cid: $cid, location: $location, parent_city: $parent_city, admin_area: $admin_area, cnty: $cnty, lat: $lat, lon: $lon, tz: $tz}';
  }
}

class Update {
  String loc;
  String utc;

  Update(this.loc, this.utc);

  Update.empty() : this("", "");

  Update.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    utc = json['utc'];
  }
}

class Now {
  // 天气情况
  String cond_txt;

  // 湿度
  String hum;

  // 温度
  String tmp;

  Now(this.cond_txt, this.hum, this.tmp);

  Now.empty() : this("", "", "");

  Now.fromJson(Map<String, dynamic> json) {
    cond_txt = json['cond_txt'];
    hum = json['hum'];
    tmp = json['tmp'];
  }

  @override
  String toString() {
    return 'Now{cond_txt: $cond_txt, hum: $hum, tmp: $tmp}';
  }
}
