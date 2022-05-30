package com.its.memberBoard.repository;

import com.its.memberBoard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> findAll(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.findAll", pagingParam);
    }

    public void save(BoardDTO boardDTO) {
        sql.insert("Board.save", boardDTO);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }


    public List<BoardDTO> search(Map<String, String> searchMap) {
        return sql.selectList("Board.search", searchMap);
    }

    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update", boardDTO);
    }

    public List<BoardDTO> findAllHits(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.findAllHits", pagingParam);
    }
}
