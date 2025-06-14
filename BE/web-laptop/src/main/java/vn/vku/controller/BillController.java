package vn.vku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import vn.vku.dto.BillDTO;
import vn.vku.dto.ProductDTO;
import vn.vku.entity.*;
import vn.vku.service.*;

import javax.validation.Valid;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@CrossOrigin("http://localhost:4200")
@RequestMapping("/bill")
@RestController
public class BillController {

    final BillService billService;

    final CustomerService customerService;

    final ProductService productService;

    final ContractDetailService contractDetailService;

    public @Autowired BillController(BillService billService, CustomerService customerService, ProductService productService, ContractDetailService contractDetailService) {
        this.billService = billService;
        this.customerService = customerService;
        this.productService = productService;
        this.contractDetailService = contractDetailService;
    }

    @RequestMapping(value = "/listBill", method = RequestMethod.GET)
    public ResponseEntity<Page<Bill>> getAllBill(@PageableDefault(size = 6) Pageable pageable) {
        Page<Bill> bills = billService.getAllBill(pageable);
        if (bills.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(bills, HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteBill/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Bill> deleteProduct(@PathVariable("id") int id) {
        Bill bill = billService.findById(id);
        if (bill == null) {
            return new ResponseEntity<Bill>(HttpStatus.NOT_FOUND);
        }
        billService.deleteBill(id);
        return new ResponseEntity<Bill>(HttpStatus.OK);
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public ResponseEntity<List<FieldError>> createProduct(@RequestBody @Valid BillDTO billDTO, BindingResult bindingResult) {
        System.out.println();
        if (bindingResult.hasErrors()) {
            return new ResponseEntity<>(bindingResult.getFieldErrors(),
                    HttpStatus.NOT_ACCEPTABLE);
        }
        Customer customer = customerService.findByUser(billDTO.getIdCustomer());
        Bill bill = new Bill(LocalDate.now(), billDTO.getReceived(), billDTO.getPhone(),
                billDTO.getAddress(), billDTO.getPaymentMethods(), billDTO.getTotalMoney(), 1, customer);
        Bill bill1 = billService.saveBill(bill);
        for (ProductDTO p : billDTO.getObject()) {
            Product product = productService.findById(p.getIdProduct());
            BillProductKey billProductKey = new BillProductKey(bill1.getIdBill(), product.getIdProduct());
            ContractDetail contractDetail = new ContractDetail(billProductKey, bill1, product, p.getQuantity(), product.getPrice());
            product.setQuantity(product.getQuantity()-p.getQuantity());
            productService.saveProduct(product);
            contractDetailService.save(contractDetail);
        }
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/billDetail/{id}", method = RequestMethod.GET)
    public ResponseEntity<List<Bill>> getAll(@PathVariable String id) {
        List<Bill> billList = billService.findByIdCustomer(id);
        if (billList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(billList, HttpStatus.OK);
    }

    @RequestMapping(value = "/xem/{id}", method = RequestMethod.GET)
    public ResponseEntity<List<ContractDetail>> getAllChiTiet(@PathVariable int id) {
        List<ContractDetail> contractDetailList = contractDetailService.findAll(id);
        if (contractDetailList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(contractDetailList, HttpStatus.OK);
    }

    @RequestMapping(value = "/duyet/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Bill> duyet(@PathVariable int id) {
        Bill bill = billService.findById(id);
        if (bill == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        bill.setStatus(2);
        billService.saveBill(bill);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/searchByName")
    public ResponseEntity<Page<Bill>> getSearchItem(@PageableDefault(size = 6) Pageable pageable,
                                                       @RequestParam String name) {
        Page<Bill> bills = billService.getSearchItem(name,pageable);
        if (bills.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(bills, HttpStatus.OK);
    }
    @GetMapping("/statisticOrder")
    public ResponseEntity<List<Bill>> listResponseEntity(@RequestParam(value = "start", required = false) String start,
                                                         @RequestParam(value = "end", required = false) String end) throws ParseException {
        if (start == null || end == null || start.equals("") || end.equals("")) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        DateTimeFormatter formatTime = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate startDate = LocalDate.parse(start, formatTime);
        LocalDate endDate = LocalDate.parse(end, formatTime);
        List<Bill> ordersList = this.billService.getListOrder(startDate, endDate);

        if (ordersList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(ordersList, HttpStatus.OK);
    }

    @GetMapping("/hot")
    public ResponseEntity<List<HotProduct>> hot() {
        return new ResponseEntity<>(contractDetailService.hot(), HttpStatus.OK);
    }

}
