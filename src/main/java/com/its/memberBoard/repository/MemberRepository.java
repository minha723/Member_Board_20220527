package com.its.memberBoard.repository;

import com.its.memberBoard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO duplicateCheck(String memberId) {
        return sql.selectOne("Member.check", memberId);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public int delete(Long id) {
        return sql.delete("Member.delete", id);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }
}
