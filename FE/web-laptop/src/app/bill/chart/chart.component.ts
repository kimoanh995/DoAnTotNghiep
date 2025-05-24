import { Component, OnInit ,ViewChild} from '@angular/core';
import {BillService} from "../../services/bill.service";
import {IBill} from "../../interface/IBill";
import {DatePipe, formatDate} from "@angular/common";
import {AbstractControl, FormControl, FormGroup, Validators} from "@angular/forms";
import {
  ApexAxisChartSeries,
  ApexChart,
  ApexFill,
  ApexYAxis,
  ApexTooltip,
  ApexMarkers,
  ApexXAxis,
  ApexPlotOptions,
  ApexTitleSubtitle
} from 'ng-apexcharts';
import {Title} from "@angular/platform-browser";
import {IHotProduct} from "../../interface/IHotProduct";

export type ChartOptions = {
  series: ApexAxisChartSeries;
  chart: ApexChart;
  xaxis: ApexXAxis;
  yaxis: ApexYAxis | ApexYAxis[];
  labels: string[];
  stroke: any; // ApexStroke;
  markers: ApexMarkers;
  plotOptions: ApexPlotOptions;
  fill: ApexFill;
  tooltip: ApexTooltip;
};

@Component({
  selector: 'app-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.css']
})

export class ChartComponent implements OnInit {
  // data = [6,3, 4, 3, 5,1];
  // billList: IBill[ ]=[];
  // constructor(private titleService: Title, private billService: BillService) { }
  //
  // ngOnInit(): void {
  //   this.titleService.setTitle("Thống Kê");
  //   this.billService.getAll().subscribe((data) =>{
  //     this.billList = data.content;
  //   });
  //
  // }
  // canvas: any;
  // ctx: any;
  // @ViewChild('mychart') mychart:any;
  //
  // ngAfterViewInit() {
  //   this.canvas = this.mychart.nativeElement;
  //   this.ctx = this.canvas.getContext('2d');
  //
  //   new Chart(this.ctx, {
  //     type: 'bar',
  //     data: {
  //       datasets: [{
  //         label: 'Số Lượng bán ra',
  //         data: this.data,
  //         backgroundColor: "rgb(115 185 243 / 65%)",
  //         borderColor: "#007ee7",
  //         fill: true,
  //       }],
  //       labels: ['Asus', 'Dell', 'Apple','Hp', 'Lenovo','MSI']
  //     },
  //   });
  // }

  pastDay = this.datePipe.transform(new Date().setDate(new Date().getDate() - 365), 'dd/MM/yyyy');
  today = this.datePipe.transform(new Date(), 'dd/MM/yyyy');
  hotProducts: IHotProduct[] = [];
  total: String = "";

  @ViewChild('chart') chart!: ChartComponent|any;
  public chartOptions: Partial<ChartOptions>|any;
  checkDateForm!: FormGroup;
  isCheckStatistic = false;
  checkStartDate = this.pastDay;
  checkEndDate = this.today;
  check = false;
  startDate!: string;
  endDate!: string;
  totalMoney = 0;
  label: string[] = [];
  totalPay: number[] = [];
  interestMoney: number[] = [];
  expectedMoney: number[] = [];
  bills: IBill[] = [];
  char: any;
  constructor(private datePipe: DatePipe, private billService: BillService, private titleService: Title) {
  }


  ngOnInit(): void {
    this.titleService.setTitle("Thống Kê Doanh Thu");
    this.checkDateForm = new FormGroup({
      checkStartDate: new FormControl('', [Validators.required]),
      checkEndDate: new FormControl('',[Validators.required])
    }, this.checkDate);

    this.billService.hot().subscribe((data) => {
      this.hotProducts = data;
    })
  }
  private checkDate(check: AbstractControl): any {
    const fromDate = check.get('checkStartDate');
    const toDate = check.get('checkEndDate');
    // @ts-ignore
    return fromDate.value <= toDate.value ? null : {errorDateTo: true};
  }
  getStatistic() {
    this.check = true;
    this.isCheckStatistic = true;
    if (this.isCheckStatistic) {
      this.label = [];
      this.totalPay = [];
      this.expectedMoney = [];
      this.interestMoney = [];
      this.totalMoney = 0;
      this.startDate = formatDate(this.checkDateForm.controls.checkStartDate.value, 'dd/MM/yyyy', 'en-US');
      this.endDate = formatDate(this.checkDateForm.controls.checkEndDate.value, 'dd/MM/yyyy', 'en-US');
      this.getInterestDay()
    }
  }

  private getInterestDay() {
    const formatter = new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
    });


    this.billService.getListStatistic(this.startDate, this.endDate).subscribe((data) => {
      this.bills = data;
      let month = new Date(this.bills[0].dateFounded);
      let tempMoney = 0;
      let total = 0;
      for (let i = 0; i < this.bills.length; i++) {
        this.totalMoney += this.bills[i].totalMoney;
        let startMonth = new Date(this.bills[i].dateFounded);
        if (month.getMonth() == startMonth.getMonth()) {
          tempMoney += this.bills[i].totalMoney;
        } else {
          total += tempMoney;
          this.totalPay.push(tempMoney);
          this.label.push("Tháng" + (month.getMonth() + 1));
          tempMoney = this.bills[i].totalMoney;
          month = startMonth;
        }
      }
      this.total = formatter.format(total);
      this.totalPay.push(tempMoney);
      this.label.push("Tháng" + (month.getMonth() + 1));
      this.statisticExected();
    })
  }
  numToString(num: number) {
    return num.toLocaleString().split(',').join(this.char || '.');
  }
  private statisticExected() {

    this.chartOptions = {
      series: [
        {
          name: "Tổng doanh thu",
          color: '#009900',
          type: 'column',
          data: this.totalPay
        }
      ],
      chart: {
        height: 350,
        type: 'line',
        stacked: false
      },
      stroke: {
        width: [0, 2, 5],
        curve: 'smooth'
      },
      plotOptions: {
        bar: {
          columnWidth: '50%'
        }
      },

      fill: {
        opacity: [0.85, 0.25, 1],
        gradient: {
          inverseColors: false,
          shade: 'light',
          type: 'vertical',
          opacityFrom: 0.85,
          opacityTo: 0.55,
          stops: [0, 100, 100, 100]
        }
      },
      xaxis: {
        labels: {
          trim: false
        },
        categories: this.label
      },
      labels: [''],

      markers: {
        size: 0
      },
      yaxis: {
        title: {
          text: 'VND'
        },
        min: 0
      },
      tooltip: {
        shared: true,
        intersect: false,
        y: {
          formatter(y: any) {
            if (typeof y !== 'undefined') {
              return y.toFixed(0) + ' VND';
            }
            return y;
          }
        }
      }
    };
  }
}
