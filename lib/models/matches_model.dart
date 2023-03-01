import 'package:demo_/models/fighters_model.dart';

class MatchesModels {
  int? id;
  int? boutsheetId;
  String? bracketOpponentId;
  String? bracketConditionId;
  String? boutType;
  FightersModel? redFighter;
  String? redFighterStatus;
  int? boutOrder;
  FightersModel? blueFighter;
  String? blueFighterStatus;
  int? age;
  int? weight;
  String? minsLength;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  FightersModel? winner;
  String? outcome;
  String? highScore;
  String? lowScore;
  String? comments;
  String? denyReason;

  MatchesModels(
      {this.id,
      this.boutsheetId,
      this.bracketOpponentId,
      this.bracketConditionId,
      this.boutType,
      this.redFighter,
      this.redFighterStatus,
      this.boutOrder,
      this.blueFighter,
      this.blueFighterStatus,
      this.age,
      this.weight,
      this.minsLength,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.winner,
      this.outcome,
      this.highScore,
      this.lowScore,
      this.comments,
      this.denyReason});

  MatchesModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    boutsheetId = json['boutsheet_id'];
    bracketOpponentId = json['bracket_opponent_id'];
    bracketConditionId = json['bracket_condition_id'];
    boutType = json['bout_type'];
    redFighter =
        (json.containsKey("red_fighter") && json["red_fighter"] != null)
            ? FightersModel.fromJson(json['red_fighter'])
            : null;
    redFighterStatus = json['red_fighter_status'];
    boutOrder = json['bout_order'];
    blueFighter =
        json.containsKey("blue_fighter") && json["blue_fighter"] != null
            ? FightersModel.fromJson(json['blue_fighter'])
            : null;
    blueFighterStatus = json['blue_fighter_status'];
    age = json['age'];
    weight = json['weight'];
    minsLength = json['mins_length'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    winner = json.containsKey("winner") && json["winner"] != null
        ? FightersModel.fromJson(json['winner'])
        : null;
    outcome = json['outcome'];
    highScore = json['high_score'];
    lowScore = json['low_score'];
    comments = json['comments'];
    denyReason = json['deny_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['boutsheet_id'] = boutsheetId;
    data['bracket_opponent_id'] = bracketOpponentId;
    data['bracket_condition_id'] = bracketConditionId;
    data['bout_type'] = boutType;
    if (redFighter != null) {
      data['red_fighter'] = redFighter!.toJson();
    }
    data['red_fighter_status'] = redFighterStatus;
    data['bout_order'] = boutOrder;
    if (blueFighter != null) {
      data['blue_fighter'] = blueFighter!.toJson();
    }
    data['blue_fighter_status'] = blueFighterStatus;
    data['age'] = age;
    data['weight'] = weight;
    data['mins_length'] = minsLength;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (winner != null) {
      data['winner'] = winner!.toJson();
    }
    data['outcome'] = outcome;
    data['high_score'] = highScore;
    data['low_score'] = lowScore;
    data['comments'] = comments;
    data['deny_reason'] = denyReason;
    return data;
  }
}
