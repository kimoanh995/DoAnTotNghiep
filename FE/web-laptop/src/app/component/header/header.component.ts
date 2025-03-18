import { Component, OnInit } from '@angular/core';
import {LoginService} from "../../services/login.service";
import {ProductService} from "../../services/product.service";
import {CartService} from "../../services/cart.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  name: string ='';
  constructor(private loginService:LoginService,private productService:ProductService,
              private cartService: CartService, private router: Router) { }

  ngOnInit(): void {
   this.name= this.loginService.getRole();
  }
  on() {
    this.productService.key = '';
    this.ngOnInit();
  }

  logout() {
    this.loginService.removeRole();
    this.loginService.removeToken();
    this.loginService.removeUserName();
    this.cartService.xoaHet();
    this.router.navigateByUrl("/login").then();
  }
}
