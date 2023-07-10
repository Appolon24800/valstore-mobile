import 'package:valstore/models/firebase_skin.dart';

class PlayerLoadoutItem {
  FirebaseSkin? skin;
  Guns? gun;

  PlayerLoadoutItem({
    this.skin,
    this.gun,
  });
}

class Loadout {
  String? subject;
  int? version;
  List<Guns>? guns;
  List<Sprays>? sprays;
  Identity? identity;
  bool? incognito;

  Loadout(
      {this.subject,
      this.version,
      this.guns,
      this.sprays,
      this.identity,
      this.incognito});

  Loadout.fromJson(Map<String, dynamic> json) {
    subject = json['Subject'];
    version = json['Version'];
    if (json['Guns'] != null) {
      guns = <Guns>[];
      json['Guns'].forEach((v) {
        guns!.add(new Guns.fromJson(v));
      });
    }
    if (json['Sprays'] != null) {
      sprays = <Sprays>[];
      json['Sprays'].forEach((v) {
        sprays!.add(new Sprays.fromJson(v));
      });
    }
    identity = json['Identity'] != null
        ? new Identity.fromJson(json['Identity'])
        : null;
    incognito = json['Incognito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subject'] = this.subject;
    data['Version'] = this.version;
    if (this.guns != null) {
      data['Guns'] = this.guns!.map((v) => v.toJson()).toList();
    }
    if (this.sprays != null) {
      data['Sprays'] = this.sprays!.map((v) => v.toJson()).toList();
    }
    if (this.identity != null) {
      data['Identity'] = this.identity!.toJson();
    }
    data['Incognito'] = this.incognito;
    return data;
  }
}

class Guns {
  String? iD;
  String? skinID;
  String? skinLevelID;
  String? chromaID;
  List<Attachment>? attachments;

  Guns(
      {this.iD,
      this.skinID,
      this.skinLevelID,
      this.chromaID,
      this.attachments});

  Guns.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    skinID = json['SkinID'];
    skinLevelID = json['SkinLevelID'];
    chromaID = json['ChromaID'];
    if (json['Attachments'] != null) {
      attachments = <Attachment>[];
      json['Attachments'].forEach((v) {
        attachments!.add(new Attachment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['SkinID'] = this.skinID;
    data['SkinLevelID'] = this.skinLevelID;
    data['ChromaID'] = this.chromaID;
    if (this.attachments != null) {
      data['Attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sprays {
  String? equipSlotID;
  String? sprayID;
  String? sprayLevelID;

  Sprays({this.equipSlotID, this.sprayID, this.sprayLevelID});

  Sprays.fromJson(Map<String, dynamic> json) {
    equipSlotID = json['EquipSlotID'];
    sprayID = json['SprayID'];
    sprayLevelID = json['SprayLevelID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EquipSlotID'] = this.equipSlotID;
    data['SprayID'] = this.sprayID;
    data['SprayLevelID'] = this.sprayLevelID;
    return data;
  }
}

class Identity {
  String? playerCardID;
  String? playerTitleID;
  int? accountLevel;
  String? preferredLevelBorderID;
  bool? hideAccountLevel;

  Identity(
      {this.playerCardID,
      this.playerTitleID,
      this.accountLevel,
      this.preferredLevelBorderID,
      this.hideAccountLevel});

  Identity.fromJson(Map<String, dynamic> json) {
    playerCardID = json['PlayerCardID'];
    playerTitleID = json['PlayerTitleID'];
    accountLevel = json['AccountLevel'];
    preferredLevelBorderID = json['PreferredLevelBorderID'];
    hideAccountLevel = json['HideAccountLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerCardID'] = this.playerCardID;
    data['PlayerTitleID'] = this.playerTitleID;
    data['AccountLevel'] = this.accountLevel;
    data['PreferredLevelBorderID'] = this.preferredLevelBorderID;
    data['HideAccountLevel'] = this.hideAccountLevel;
    return data;
  }
}

class Attachment {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }

  Attachment.fromJson(Map<String, dynamic> json) {}
}
