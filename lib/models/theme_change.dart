class ThemeChange {
  int? id;
  String? name;
  int? value;

  ThemeChange(this.id, this.name, this.value);

  factory ThemeChange.fromMap(Map<String, dynamic> data) {
      return ThemeChange( 
         data['id'], 
         data['name'], 
         data['value']
      ); 
   }

   Map<String, dynamic> toMap() => {
      "id": id, 
      "name": name, 
      "value": value
   }; 
}