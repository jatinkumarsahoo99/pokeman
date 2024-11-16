class PokemonResponseModel {
  List<Data>? data;
  String? page;
  String? pageSize;
  String? count;
  String? totalCount;

  PokemonResponseModel(
      {this.data, this.page, this.pageSize, this.count, this.totalCount});

  PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    page = (json['page']??0).toString();
    pageSize = (json['pageSize']??0).toString();
    count = (json['count']??0).toString();
    totalCount = (json['totalCount']??0).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['count'] = count;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? supertype;
  String? hp;
  String? evolvesFrom;
  List<Attacks>? attacks;
  List<Weaknesses>? weaknesses;
  String? convertedRetreatCost;
  Set? set;
  String? number;
  String? artist;
  String? rarity;
  String? flavorText;
  // List<int>? nationalPokedexNumbers;
  Legalities? legalities;
  Images? images;
  Tcgplayer? tcgplayer;
  Cardmarket? cardmarket;

  Data(
      {this.id,
        this.name,
        this.supertype,
        this.hp,
        this.evolvesFrom,
        this.attacks,
        this.weaknesses,
        this.convertedRetreatCost,
        this.set,
        this.number,
        this.artist,
        this.rarity,
        this.flavorText,
        this.legalities,
        this.images,
        this.tcgplayer,
        this.cardmarket});

  @override
  String toString() {
    return set?.name ?? 'Unknown'; // Return the name or a default string
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supertype = json['supertype'];
    hp = json['hp'];
    evolvesFrom = json['evolvesFrom'];
    if (json['attacks'] != null) {
      attacks = <Attacks>[];
      json['attacks'].forEach((v) {
        attacks!.add(Attacks.fromJson(v));
      });
    }
    if (json['weaknesses'] != null) {
      weaknesses = <Weaknesses>[];
      json['weaknesses'].forEach((v) {
        weaknesses!.add(Weaknesses.fromJson(v));
      });
    }
    convertedRetreatCost = (json['convertedRetreatCost']??0).toString();
    set = json['set'] != null ? Set.fromJson(json['set']) : null;
    number = json['number'];
    artist = json['artist'];
    rarity = json['rarity'];
    flavorText = json['flavorText'];
    // nationalPokedexNumbers = (json['nationalPokedexNumbers']??[]);
    legalities = json['legalities'] != null
        ? Legalities.fromJson(json['legalities'])
        : null;
    images =
    json['images'] != null ? Images.fromJson(json['images']) : null;
    tcgplayer = json['tcgplayer'] != null
        ? Tcgplayer.fromJson(json['tcgplayer'])
        : null;
    cardmarket = json['cardmarket'] != null
        ? Cardmarket.fromJson(json['cardmarket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['supertype'] = supertype;
    data['hp'] = hp;
    data['evolvesFrom'] = evolvesFrom;
    if (attacks != null) {
      data['attacks'] = attacks!.map((v) => v.toJson()).toList();
    }
    if (weaknesses != null) {
      data['weaknesses'] = weaknesses!.map((v) => v.toJson()).toList();
    }
    data['convertedRetreatCost'] = convertedRetreatCost;
    if (set != null) {
      data['set'] = set!.toJson();
    }
    data['number'] = number;
    data['artist'] = artist;
    data['rarity'] = rarity;
    data['flavorText'] = flavorText;
    // data['nationalPokedexNumbers'] = nationalPokedexNumbers;
    if (legalities != null) {
      data['legalities'] = legalities!.toJson();
    }
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (tcgplayer != null) {
      data['tcgplayer'] = tcgplayer!.toJson();
    }
    if (cardmarket != null) {
      data['cardmarket'] = cardmarket!.toJson();
    }
    return data;
  }
}

class Attacks {
  String? name;
  List<String>? cost;
  String? convertedEnergyCost;
  String? damage;
  String? text;

  Attacks(
      {this.name, this.cost, this.convertedEnergyCost, this.damage, this.text});

  Attacks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'].cast<String>();
    convertedEnergyCost = (json['convertedEnergyCost']??0).toString();
    damage = json['damage'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cost'] = cost;
    data['convertedEnergyCost'] = convertedEnergyCost;
    data['damage'] = damage;
    data['text'] = text;
    return data;
  }
}

class Weaknesses {
  String? type;
  String? value;

  Weaknesses({this.type, this.value});

  Weaknesses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class Set {
  String? id;
  String? name;
  String? series;
  String? printedTotal;
  String? total;
  Legalities? legalities;
  String? ptcgoCode;
  String? releaseDate;
  String? updatedAt;
  ImagesS? imagesS;

  Set(
      {this.id,
        this.name,
        this.series,
        this.printedTotal,
        this.total,
        this.legalities,
        this.ptcgoCode,
        this.releaseDate,
        this.updatedAt,
        this.imagesS});

  @override
  String toString() {
    return name ?? 'Unknown'; // Return the name or a default string
  }

  Set.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    series = json['series'];
    printedTotal = (json['printedTotal']??"").toString();
    total = (json['total']??0).toString();
    legalities = json['legalities'] != null
        ? Legalities.fromJson(json['legalities'])
        : null;
    ptcgoCode = json['ptcgoCode'];
    releaseDate = json['releaseDate'];
    updatedAt = json['updatedAt'];
    imagesS =
    json['images'] != null ? ImagesS.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['series'] = series;
    data['printedTotal'] = printedTotal;
    data['total'] = total;
    if (legalities != null) {
      data['legalities'] = legalities!.toJson();
    }
    data['ptcgoCode'] = ptcgoCode;
    data['releaseDate'] = releaseDate;
    data['updatedAt'] = updatedAt;
    if (imagesS != null) {
      data['imagesS'] = imagesS!.toJson();
    }
    return data;
  }
}

class Legalities {
  String? unlimited;

  Legalities({this.unlimited});

  Legalities.fromJson(Map<String, dynamic> json) {
    unlimited = json['unlimited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unlimited'] = unlimited;
    return data;
  }
}

class ImagesS {
  String? symbol;
  String? logo;

  ImagesS({this.symbol, this.logo});

  ImagesS.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['logo'] = logo;
    return data;
  }
}

class Images {
  String? small;
  String? large;

  Images({this.small, this.large});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class Tcgplayer {
  String? url;
  String? updatedAt;
  Prices? prices;

  Tcgplayer({this.url, this.updatedAt, this.prices});

  Tcgplayer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    updatedAt = json['updatedAt'];
    prices =
    json['prices'] != null ? Prices.fromJson(json['prices']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['updatedAt'] = updatedAt;
    if (prices != null) {
      data['prices'] = prices!.toJson();
    }
    return data;
  }
}

class Prices {
  Holofoil? holofoil;
  ReverseHolofoil? reverseHolofoil;

  Prices({this.holofoil, this.reverseHolofoil});

  Prices.fromJson(Map<String, dynamic> json) {
    holofoil = json['holofoil'] != null
        ? Holofoil.fromJson(json['holofoil'])
        : null;
    reverseHolofoil = json['reverseHolofoil'] != null
        ? ReverseHolofoil.fromJson(json['reverseHolofoil'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (holofoil != null) {
      data['holofoil'] = holofoil!.toJson();
    }
    if (reverseHolofoil != null) {
      data['reverseHolofoil'] = reverseHolofoil!.toJson();
    }
    return data;
  }
}

class Holofoil {
  double? low;
  double? mid;
  double? high;
  double? market;
  String? directLow;

  Holofoil({this.low, this.mid, this.high, this.market, this.directLow});

  Holofoil.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = json['high'];
    market = json['market'];
    directLow = (json['directLow']??0).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low'] = low;
    data['mid'] = mid;
    data['high'] = high;
    data['market'] = market;
    data['directLow'] = directLow;
    return data;
  }
}

class ReverseHolofoil {
  double? low;
  double? mid;
  String? high;
  double? market;
  String? directLow;

  ReverseHolofoil({this.low, this.mid, this.high, this.market, this.directLow});

  ReverseHolofoil.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = (json['high']??"").toString();
    market = json['market'];
    directLow = (json['directLow']??"").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low'] = low;
    data['mid'] = mid;
    data['high'] = high;
    data['market'] = market;
    data['directLow'] = directLow;
    return data;
  }
}

class Cardmarket {
  String? url;
  String? updatedAt;

  Cardmarket({this.url, this.updatedAt});

  Cardmarket.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
