package vn.vku.service;

import vn.vku.entity.ContractDetail;
import vn.vku.entity.HotProduct;

import java.util.List;

public interface ContractDetailService {
    void save(ContractDetail contractDetail);

    List<ContractDetail> findAll(int id);

    List<HotProduct> hot();
}
