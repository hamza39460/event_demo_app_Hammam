class FightersModel {
  int? id;
  int? eventId;
  String? firstName;
  String? lastName;
  String? usaBoxingId;
  int? numberOfFights;
  String? gender;
  String? dateOfBirth;
  String? picture;
  String? gymName;
  String? teamId;
  String? usaBoxingNumberConfirmedAt;
  String? usaBoxingNumberConfirmedBy;
  String? registerConfirmedAt;
  String? registerConfirmedBy;
  String? checkinAt;
  String? checkinBy;
  String? checkinCountry;
  String? weighinAt;
  String? weighinBy;
  String? weight;
  String? lowerWeightLimit;
  String? upperWeightLimit;
  String? bracketId;
  String? bracketConditionId;
  bool? onHold;
  String? comment;

  FightersModel(
      {this.id,
      this.eventId,
      this.firstName,
      this.lastName,
      this.usaBoxingId,
      this.numberOfFights,
      this.gender,
      this.dateOfBirth,
      this.picture,
      this.gymName,
      this.teamId,
      this.usaBoxingNumberConfirmedAt,
      this.usaBoxingNumberConfirmedBy,
      this.registerConfirmedAt,
      this.registerConfirmedBy,
      this.checkinAt,
      this.checkinBy,
      this.checkinCountry,
      this.weighinAt,
      this.weighinBy,
      this.weight,
      this.lowerWeightLimit,
      this.upperWeightLimit,
      this.bracketId,
      this.bracketConditionId,
      this.onHold,
      this.comment});

  FightersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    usaBoxingId = json['usa_boxing_id'];
    numberOfFights = json['number_of_fights'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    picture = json['picture'];
    gymName = json['gym_name'];
    teamId = json['team_id'];
    usaBoxingNumberConfirmedAt = json['usa_boxing_number_confirmed_at'];
    usaBoxingNumberConfirmedBy = json['usa_boxing_number_confirmed_by'];
    registerConfirmedAt = json['register_confirmed_at'];
    registerConfirmedBy = json['register_confirmed_by'];
    checkinAt = json['checkin_at'];
    checkinBy = json['checkin_by'];
    checkinCountry = json['checkin_country'];
    weighinAt = json['weighin_at'];
    weighinBy = json['weighin_by'];
    weight = json['weight'];
    lowerWeightLimit = json['lower_weight_limit'];
    upperWeightLimit = json['upper_weight_limit'];
    bracketId = json['bracket_id'];
    bracketConditionId = json['bracket_condition_id'];
    onHold = json['on_hold'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['event_id'] = eventId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['usa_boxing_id'] = usaBoxingId;
    data['number_of_fights'] = numberOfFights;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['picture'] = picture;
    data['gym_name'] = gymName;
    data['team_id'] = teamId;
    data['usa_boxing_number_confirmed_at'] = usaBoxingNumberConfirmedAt;
    data['usa_boxing_number_confirmed_by'] = usaBoxingNumberConfirmedBy;
    data['register_confirmed_at'] = registerConfirmedAt;
    data['register_confirmed_by'] = registerConfirmedBy;
    data['checkin_at'] = checkinAt;
    data['checkin_by'] = checkinBy;
    data['checkin_country'] = checkinCountry;
    data['weighin_at'] = weighinAt;
    data['weighin_by'] = weighinBy;
    data['weight'] = weight;
    data['lower_weight_limit'] = lowerWeightLimit;
    data['upper_weight_limit'] = upperWeightLimit;
    data['bracket_id'] = bracketId;
    data['bracket_condition_id'] = bracketConditionId;
    data['on_hold'] = onHold;
    data['comment'] = comment;
    return data;
  }
}
