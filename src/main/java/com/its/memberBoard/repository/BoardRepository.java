package com.its.memberBoard.repository;

import com.its.memberBoard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public void save(BoardDTO boardDTO) {
        sql.insert("Board.insert", boardDTO);
    }
}
