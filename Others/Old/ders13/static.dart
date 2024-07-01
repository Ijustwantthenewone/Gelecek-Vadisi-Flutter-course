class StatickSinifi {
  static var deneme = 231312313;

var emp_name;
  int? emp_salary;

    showDetails() {
    print("Name of the Employee is: ${emp_name}");
    print("Salary of the Employee is: ${emp_salary}");
    print("Dept. of the Employee is: ${deneme}");
  }  
}

void main(){
  StatickSinifi.deneme;
  StatickSinifi s1 = StatickSinifi();
  s1.showDetails();
}
