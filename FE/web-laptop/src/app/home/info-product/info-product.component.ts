import {Component, OnInit} from '@angular/core';
import {ProductService} from "../../services/product.service";
import {ActivatedRoute, Router} from "@angular/router";
import {IProductDTO} from "../../interface/IProductDTO";
import {CartService} from "../../services/cart.service";
import {AlertService} from "../../product/alert.service";
import {FormControl, FormGroup} from "@angular/forms";
import {LoginService} from "../../services/login.service";
import {Title} from "@angular/platform-browser";
import {EvaluateDTO} from "../../interface/EvaluateDTO";
import {IAccountCustomer} from "../../interface/IAccountCustomer";
import {CustomerService} from "../../services/customer.service";
import {Evaluates} from "../../interface/Evaluates";

@Component({
  selector: 'app-info-product',
  templateUrl: './info-product.component.html',
  styleUrls: ['./info-product.component.css']
})
export class InfoProductComponent implements OnInit {
  tag = ["Asus", "Dell", "Apple", "HP", "Lenovo", "MSI"];

  product: IProductDTO = {
    idProduct: 0,
    productName: '',
    price: 0,
    quantity: 0,
    avt: '',
    screen: '',
    hdh: '',
    cameraT: '',
    cpu: '',
    ram: '',
    rom: '',
    sdCard: '',
    pin: '',
    idType: 0,
    idPromotion: 0,
    nameType: '',
    numOfStar: 0,
    numOfReview: 0
  };
  // @ts-ignore
  id: number;
  searchItem!: FormGroup;
  totalItem: number = 0;
  name: string = '';
  private char: string = '';
  createE!: FormGroup;
  evaluate!: EvaluateDTO;
  accountCustomer!: IAccountCustomer;
  listBl: Evaluates[] = [];

  constructor(private productService: ProductService,
              private router: Router,
              private activatedRoute: ActivatedRoute,
              private cartService: CartService,
              private alertService: AlertService,
              private loginService: LoginService,
              private titleService: Title,
              private customerService: CustomerService) {
  }

  ngOnInit(): void {
    this.titleService.setTitle("Chi Tiết Giỏ Hàng");
    this.name = this.loginService.getUserName();
    this.totalItem = this.cartService.getSoLuongGioHang();
    this.searchItem = new FormGroup({
      itemSearch: new FormControl('')
    });
    this.activatedRoute.paramMap.subscribe((paramMap) => {
      // @ts-ignore
      this.id = paramMap.get('id');
      this.productService.getProductById(this.id).subscribe((data) => {
        this.product = data;
      });
      this.productService.getAllBinhLuan(this.id).subscribe((data) => {
        console.log(data);
        this.listBl = data;

      })
    });
    this.createE = new FormGroup({
      numOfStar: new FormControl(''),
      comment: new FormControl('')
    });
    if (this.name !== '') {
      this.customerService.getCustomerUser(this.name).subscribe((data) => {
        this.accountCustomer = data;
      })
    }
  }

  searchTag(t: string) {
    this.productService.key = t;
    this.router.navigateByUrl("/").then();
  }

  add(p: number, productName: string, price: number, avt: string) {
    this.cartService.addToGioHang(p, productName, price, avt);
    this.alertService.showAlertSuccess("Thêm thành công sản phẩm!");
    this.ngOnInit();
  }

  search() {
    this.productService.key = this.searchItem.value.itemSearch;
    this.router.navigateByUrl("/").then();
  }

  logout() {
    this.loginService.removeRole();
    this.loginService.removeToken();
    this.loginService.removeUserName();
    this.cartService.xoaHet();
    this.router.navigateByUrl("/login").then();
  }

  numToString(num: number) {
    return num.toLocaleString().split(',').join(this.char || '.');
  }

  createEvaluate() {
    if (this.createE.value.numOfStar < 1) {
      this.alertService.showMessageWarring("Bạn chưa đánh giá!");
    } else if (this.createE.value.comment === '') {
      this.alertService.showMessageWarring("Bạn chưa bình luận!");
    } else if (this.name === '') {
      this.alertService.showMessageWarring("Bạn chưa đăng nhập!");
    }
    this.evaluate = new EvaluateDTO(this.createE.value.numOfStar, this.createE.value.comment, this.product.idProduct, this.accountCustomer.idCustomer);
    this.productService.createEvaluate(this.evaluate).subscribe((data) => {
      this.alertService.showAlertSuccess("Cảm ơn bạn đã đánh giá!");
      this.ngOnInit();
    })
  }
}
