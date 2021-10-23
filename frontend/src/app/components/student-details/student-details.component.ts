import { Component, OnInit } from '@angular/core';
import { StudentService } from 'src/app/services/student.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ClassService } from 'src/app/services/class.service';

@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.css']
})
export class StudentDetailsComponent implements OnInit {
  currentStudent = null;
  message = '';
  showMsg: boolean = false;
  classes: any;

  constructor(
    private studentService: StudentService,
    private route: ActivatedRoute,
    private router: Router, private classService: ClassService) { }

  ngOnInit(): void {
    this.message = '';
    this.showMsg = false;
    this.getStudent(this.route.snapshot.paramMap.get('id'));
    this.getClasses();
  }

  getStudent(id): void {
    this.studentService.read(id)
      .subscribe(
        item => {
          this.currentStudent = item.student;
          console.log(item);
        },
        error => {
          console.log(error);
        }
    );
  }

  updateStudent(): void {
    this.studentService.update(this.currentStudent.id, this.currentStudent)
      .subscribe(
        response => {
          console.log(response);
          this.message = 'The student detail was updated successfully!';
          this.showMsg = true;

        },
        error => {
          console.log(error);
        }
    );
  }

  deleteStudent(): void {
    if(confirm('This action will delete this student. Are you sure?')) {
      this.studentService.delete(this.currentStudent.id)
      .subscribe(
        response => {
          console.log(response);
          this.router.navigate(['/students']);
        },
        error => {
          console.log(error);
        }
    );
    }
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
