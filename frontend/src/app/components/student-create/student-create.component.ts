import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { StudentService } from 'src/app/services/student.service';
import { ClassService } from 'src/app/services/class.service';


@Component({
  selector: 'app-student-create',
  templateUrl: './student-create.component.html',
  styleUrls: ['./student-create.component.css']
})
export class StudentCreateComponent implements OnInit {
  student = {
    first_name: '',
    last_name: '',
    class_id: '',
    date_of_birth: ''
  };
  submitted = false;
  errors: any; 
  classes: any;
  
  constructor(private studentService: StudentService, public router: Router, private classService: ClassService) { }

  ngOnInit(): void {
    this.getClasses();
  }

  /**
   * Add a new student
   */
  createStudent(): void {
    console.log(this.student);
    const data = {
      first_name: this.student.first_name,
      last_name: this.student.last_name,
      class_id: this.student.class_id,
      date_of_birth: this.student.date_of_birth,
    };

    this.studentService.create(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
        },
        error => {
          this.errors = Object.values(error.error);
          console.log(this.errors);
        }
      );
    }
    
    newStudent(): void {
      this.submitted = false;
      this.student = {
        first_name: '',
        last_name: '',
        class_id: '',
        date_of_birth: ''
      };
    }

    getClasses(): void {
      this.classService.readAll()
        .subscribe(
          items => {
            this.classes = items.classes;
            console.log(items);
          },
          error => {
            console.log(error);
          }
        );
    }
}
