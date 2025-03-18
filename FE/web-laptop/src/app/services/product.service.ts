import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {TokenStorageService} from "../security/token-storage.service";
import {Observable} from "rxjs";
import {IProductDTO} from "../interface/IProductDTO";
import {LoginService} from "./login.service";
import {IEvaluate} from "../interface/IEvaluate";
import {EvaluateDTO} from "../interface/EvaluateDTO";

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  key: string='';
  httpOptions: any;
  public API: string = "http://localhost:8080/product";
  public API_CR: string = "http://localhost:8080/product/createProduct";
  constructor(private http: HttpClient, private tokenStorage: TokenStorageService,private loginService: LoginService) {
    this.httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': this.loginService.getToken(),
        'Access-Control-Allow-Origin': 'http://localhost:4200',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
      }),
    };
  }
  getAllProduct(): Observable<any>{
    return this.http.get<any>(this.API+'/listProduct',this.httpOptions)
  }
  getAllProductHome(): Observable<any>{
    return this.http.get<any>(this.API+'/listHomeProduct')
  }
  createProduct(product: IProductDTO): Observable<any>{
    return this.http.post<any>(this.API_CR,product,this.httpOptions)
  }
  deleteProduct(id: number): Observable<any>{
    return this.http.delete<any>(this.API+'/deleteProduct/'+id,this.httpOptions);
  }
  getProductById(id: number): Observable<IProductDTO>{
    return this.http.get<IProductDTO>(this.API+'/viewProduct/' +id);
  }
  update(product: IProductDTO,id: number): Observable<any>{
    return this.http.put<any>(this.API+'/updateProduct/' + id, product,this.httpOptions);
  }
  searchItem(t: string):Observable<any>{
    return this.http.get<any>(this.API+'/searchItem?itemSearch='+ t);
  }
  getSearchProduct(itemSearch: string, page: number): Observable<any> {
    return this.http.get<any>(this.API+'/searchItem?itemSearch='+ itemSearch + '&page=' + page);
  }
  createEvaluate(evaluete: EvaluateDTO):Observable<any>{
    return this.http.post<any>(this.API+'/createEvaluate',evaluete,this.httpOptions)
  }
  getAllBinhLuan(id:number):Observable<any>{
    return this.http.get<any>(this.API+'/getBinhLuan/'+id,this.httpOptions);
  }

  searchItem2(t: string):Observable<any>{
    return this.http.get<any>(this.API+'/searchItem2?itemSearch='+ t);
  }
  getSearchProduct2(itemSearch: string, page: number): Observable<any> {
    return this.http.get<any>(this.API+'/searchItem2?itemSearch='+ itemSearch + '&page=' + page);
  }
}
