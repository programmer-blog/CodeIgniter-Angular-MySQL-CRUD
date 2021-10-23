import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ClassService } from 'src/app/services/class.service';

@Component({
  selector: 'app-class-create',
  templateUrl: './class-create.component.html',
  styleUrls: ['./class-create.component.css']
})
export class ClassCreateComponent implements OnInit {

  class = {
    name: '',
    code: '',
    status: '',
    maximum_students: '',
    description: ''
  };
  submitted = false;
  errors: any;  
  
  constructor(private classService: ClassService,   public router: Router) { }

  ngOnInit(): void {
  }

  createClass(): void {
    const data = {
      name: this.class.name,
      code: this.class.code,
      status: this.class.status,
      maximum_students: this.class.maximum_students,
      description: this.class.description
  };

    this.classService.create(data)
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

    newClass(): void {
      this.submitted = false;
      this.class = {
        name: '',
        code: '',
        status: '',
        maximum_students: '',
        description: ''
      };
    }
}
