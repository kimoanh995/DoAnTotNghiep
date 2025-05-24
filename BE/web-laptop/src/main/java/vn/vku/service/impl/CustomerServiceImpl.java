package vn.vku.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.vku.entity.Bill;
import vn.vku.entity.Customer;
import vn.vku.entity.Oder;
import vn.vku.repository.BillRepository;
import vn.vku.repository.CustomerRepository;
import vn.vku.repository.OderRepository;
import vn.vku.service.CustomerService;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    final CustomerRepository customerRepository;
    final OderRepository oderRepository;
    final BillRepository billRepository;

    public @Autowired CustomerServiceImpl(CustomerRepository customerRepository, OderRepository oderRepository, BillRepository billRepository) {
        this.customerRepository = customerRepository;
        this.oderRepository = oderRepository;
        this.billRepository = billRepository;
    }

    @Override
    public Page<Customer> getAllCustomer(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }

    @Override
    public Customer findById(String id) {
        return customerRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteCustomer(String id) {
        customerRepository.deleteById(id);
    }

    @Override
    public Page<Customer> searchCustomer(String name, Pageable pageable) {
        return this.customerRepository.findByAll(name, pageable);
    }

    @Override
    public void saveCustomer(Customer customer) {
        this.customerRepository.save(customer);
    }

    @Override
    public Customer findByUser(String id) {
        return this.customerRepository.findByUser(id);
    }

    @Override
    public List<Bill> history(final String id) {
        List<Bill> list = new ArrayList<>();
        for (Bill b : billRepository.findAll()) {
            if (b.getCustomer().getIdCustomer().equals(id) && b.getStatus() == 2) {
                list.add(b);
            }
        }
        return list;
    }
}
