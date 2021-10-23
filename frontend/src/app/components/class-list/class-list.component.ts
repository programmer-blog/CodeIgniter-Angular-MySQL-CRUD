import { Component, OnInit } from '@angular/core';
import { ClassService } from 'src/app/services/class.service';

@Component({
  selector: 'app-class-list',
  templateUrl: './class-list.component.html',
  styleUrls: ['./class-list.component.css']
})
export class ClassListComponent implements OnInit {

  classes: any;
  currentClass = null;
  currentIndex = -1;
  name = '';
  classItem : any;

  constructor(private classService: ClassService) { }

  ngOnInit(): void {
    this.getClasses();
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

  refresh(): void {
    this.getClasses();
    this.currentClass = null;
    this.currentIndex = -1;
  }

  setCurrentClass(item, index): void {
    this.classService.read(item.id)
      .subscribe(
        selectedClass => {
          this.classItem = selectedClass.class;
          this.currentClass = this.classItem;
          console.log(this.currentClass);
        },
        error => {
          console.log(error);
        }
      );
    this.currentIndex = index;
  }
}
