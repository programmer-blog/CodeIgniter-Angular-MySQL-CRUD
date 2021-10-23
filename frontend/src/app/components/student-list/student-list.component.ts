import { Component, OnInit } from '@angular/core';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {

  studnets: any;
  currentStudent = null;
  currentIndex = -1;
  name = '';
  studentItem : any;

  constructor(private studentService: StudentService) { }

  ngOnInit(): void {
    this.getStudents();
  }

  getStudents(): void {
    this.studentService.readAll()
      .subscribe(
        items => {
          this.studnets = items.students;
          console.log(items);
        },
        error => {
          console.log(error);
        }
      );
  }

  setCurrentStudent(item, index): void {
    this.studentService.read(item.id)
      .subscribe(
        selectedStudent => {
          this.studentItem = selectedStudent.student;
          this.currentStudent = this.studentItem;
          console.log(this.currentStudent);
        },
        error => {
          console.log(error);
        }
      );
    this.currentIndex = index;
  }

}
