import { Component, OnInit } from '@angular/core';
import { ClassService } from 'src/app/services/class.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-class-details',
  templateUrl: './class-details.component.html',
  styleUrls: ['./class-details.component.css']
})
export class ClassDetailsComponent implements OnInit {
  currentClass = null;
  message = '';
  showMsg: boolean = false;

  constructor(
    private classService: ClassService,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit(): void {
    this.message = '';
    this.showMsg = false;
    this.getClass(this.route.snapshot.paramMap.get('id'));
  }

  getClass(id): void {
    this.classService.read(id)
      .subscribe(
        item => {
          this.currentClass = item.class;
          console.log(item);
        },
        error => {
          console.log(error);
        }
    );
  }

  updateClass(): void {
    this.classService.update(this.currentClass.id, this.currentClass)
      .subscribe(
        response => {
          console.log(response);
          this.message = 'The class was updated successfully!';
          this.showMsg = true;

        },
        error => {
          console.log(error);
        }
    );
  }

  deleteClass(): void {
    if(confirm('This action will delete this class. Are you sure?')) {
      this.classService.delete(this.currentClass.id)
      .subscribe(
        response => {
          console.log(response);
          this.router.navigate(['/classes']);
        },
        error => {
          console.log(error);
        }
    );
    }
  }
}
