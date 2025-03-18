import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {IProductType} from "../../interface/IProductType";
import {ProductTypeService} from "../../services/product-type.service";
import {IPromotion} from "../../interface/IPromotion";
import {PromotionService} from "../../services/promotion.service";
import {ProductService} from "../../services/product.service";
import {Router} from "@angular/router";
import {AlertService} from "../alert.service";

@Component({
  selector: 'app-create-product',
  templateUrl: './create-product.component.html',
  styleUrls: ['./create-product.component.css']
})
export class CreateProductComponent implements OnInit {
  createProduct!: FormGroup;
  productType: IProductType[] =[];
  promotion: IPromotion[] =[];

  constructor(private productTypeService: ProductTypeService,
              private promotionService: PromotionService,private productService: ProductService,
              private router: Router, private alertService: AlertService) { }

  ngOnInit(): void {
    this.productTypeService.findAllProductType().subscribe((data) => {
      this.productType = data;
    });
    this.promotionService.findAllPromotion().subscribe((data) => {
      this.promotion = data;
    });
    this.createProduct = new FormGroup({
      productName: new FormControl('',[Validators.required]),
      price: new FormControl('',[Validators.required]),
      quantity: new FormControl('',[Validators.required]),
      avt: new FormControl('',[Validators.required]),
      screen: new FormControl('',[Validators.required]),
      hdh: new FormControl('',[Validators.required]),
      cameraT: new FormControl('',[Validators.required]),
      cpu: new FormControl('',[Validators.required]),
      ram: new FormControl('',[Validators.required]),
      rom: new FormControl('',[Validators.required]),
      sdCard: new FormControl('',[Validators.required]),
      pin: new FormControl('',[Validators.required]),
      idType: new FormControl('',[Validators.required]),
      idPromotion: new FormControl('',[Validators.required]),
    })
  }

  create() {
    this.productService.createProduct(this.createProduct.value).subscribe((data)=>{
      this.router.navigate(['/listProduct']);
      this.alertService.showAlertSuccess("Tạo Mới Thành Công!")
    })
  }
}
