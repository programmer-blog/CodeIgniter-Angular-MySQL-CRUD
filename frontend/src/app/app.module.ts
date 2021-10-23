import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { Routes, RouterModule } from '@angular/router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ClassCreateComponent } from './components/class-create/class-create.component';
import { ClassDetailsComponent } from './components/class-details/class-details.component';
import { ClassListComponent } from './components/class-list/class-list.component';
import { StudentCreateComponent } from './components/student-create/student-create.component';
import { StudentDetailsComponent } from './components/student-details/student-details.component';
import { StudentListComponent } from './components/student-list/student-list.component';

const routes: Routes = [
  { path: '', redirectTo: 'classes', pathMatch: 'full' },
  { path: 'classes', component: ClassListComponent },
  { path: 'classes/:id', component: ClassDetailsComponent },
  { path: 'create', component: ClassCreateComponent },
  { path: 'students', component: StudentListComponent },
  { path: 'students/:id', component: StudentDetailsComponent },
  { path: 'add', component: StudentCreateComponent }

];

@NgModule({
  declarations: [
    AppComponent,
    ClassCreateComponent,
    ClassDetailsComponent,
    ClassListComponent,
    StudentCreateComponent,
    StudentDetailsComponent,
    StudentListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
