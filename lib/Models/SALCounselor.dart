
class SALCounselor {
    final String id;
    final String firstName;
    final String lastName;

  SALCounselor(this.id, this.firstName, this.lastName);

  factory SALCounselor.fromJson(Map<String, dynamic> json) => SALCounselor(json["id"],
                              json["firstName"],
                              json["lastName"]); 

   Map<String, dynamic> toJson() => 
   {
      "id": id,
      "firstName": firstName,
      "lastName": lastName
    };
}