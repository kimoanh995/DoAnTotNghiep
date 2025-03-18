package vn.vku.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.vku.entity.Bill;

import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BillRepository  extends JpaRepository<Bill,Integer> {
    @Query("select b from Bill b where b.customer.idCustomer like %:id%")
    List<Bill> findByList(@Param("id") String id);

    @Query("select b from Bill b where b.customer.idCustomer like %:id% ")
    Page<Bill> findByName(@Param("id") String id, Pageable pageable);

    @Query("select o from Bill o " +
            "where o.dateFounded between :startDate and :endDate order by  o.dateFounded")
    List<Bill> getList(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
}
