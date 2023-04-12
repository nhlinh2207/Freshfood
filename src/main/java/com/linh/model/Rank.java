package com.linh.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.linh.utils.CustomDateSerializer;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tbl_rank")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Rank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Column(name = "RankNumber")
    private Integer rankNumber;

    @Column(name = "RankValue")
    private String rankValue;

    @Column(name = "RankCustomerName")
    private String rankCustomerName;

    @Column(name = "RankContent")
    private String rankContent;

    @ManyToOne
    @JoinColumn(name = "ProductId")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    @JsonSerialize(using = CustomDateSerializer.class)
    @Column(name = "CreateTime")
    private Date createTime;

    @JsonSerialize(using = CustomDateSerializer.class)
    @Column(name = "modifiedTme")
    private Date modifiedTime;
}
