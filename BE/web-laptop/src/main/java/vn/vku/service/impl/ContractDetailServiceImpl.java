package vn.vku.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.vku.entity.ContractDetail;
import vn.vku.entity.HotProduct;
import vn.vku.entity.Product;
import vn.vku.repository.ContractDetailRepository;
import vn.vku.repository.ProductRepository;
import vn.vku.service.ContractDetailService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ContractDetailServiceImpl implements ContractDetailService {

    final ContractDetailRepository contractDetailRepository;
    final ProductRepository productRepository;

    public @Autowired ContractDetailServiceImpl(ContractDetailRepository contractDetailRepository, ProductRepository productRepository) {
        this.contractDetailRepository = contractDetailRepository;
        this.productRepository = productRepository;
    }

    @Override
    public void save(ContractDetail contractDetail) {
        this.contractDetailRepository.save(contractDetail);
    }

    @Override
    public List<ContractDetail> findAll(int id) {
        return this.contractDetailRepository.findByMaHD(id);
    }

    @Override
    public List<HotProduct> hot() {
        final List<HotProduct> list = new ArrayList<>();

        final List<ContractDetail> contractDetails = contractDetailRepository.findAll();
        final int[] count = new int[9999999];

        final List<Product> products = productRepository.findAll();

        for (ContractDetail contractDetail : contractDetails) {
            ++count[contractDetail.getProduct().getIdProduct()];
        }

        for (ContractDetail contractDetail : contractDetails) {
            final int id = contractDetail.getProduct().getIdProduct();
            final HotProduct hotProduct = new HotProduct(contractDetail.getProduct(), count[id]);
            list.add(hotProduct);
        }

        for (Product product: products) {
            HotProduct hotProduct = new HotProduct(product, 0);
            if (!list.contains(hotProduct)) {
                list.add(hotProduct);
            }
        }

        list.sort((o1, o2) -> o2.quantity - o1.quantity);

        return list;
    }
}
