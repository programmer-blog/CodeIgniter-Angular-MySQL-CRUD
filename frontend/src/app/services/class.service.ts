import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

const baseURL = 'http://localhost:8080/class';

@Injectable({
  providedIn: 'root'
})
export class ClassService {
  
  constructor(private httpClient: HttpClient) { }

  readAll(): Observable<any> {
    return this.httpClient.get(baseURL);
  }

  read(id): Observable<any> {
    return this.httpClient.get(`${baseURL}/${id}`);
  }

  create(data): Observable<any> {
    return this.httpClient.post(baseURL, data);
  }

  update(id, data): Observable<any> {
    return this.httpClient.put(`${baseURL}/${id}`, data);
  }

  delete(id): Observable<any> {
    return this.httpClient.delete(`${baseURL}/${id}`);
  }
}
