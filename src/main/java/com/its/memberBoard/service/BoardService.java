package com.its.memberBoard.service;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
//    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3;
    int PAGE_LIMIT = 5;

    public List<BoardDTO> findAll(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return boardRepository.findAll(pagingParam);
    }

    public PageDTO paging(int page) {
    int boardCount = boardRepository.boardCount();
    int maxPage= (int) (Math.ceil((double) boardCount / PAGE_LIMIT));
    int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
    int endPage = startPage + BLOCK_LIMIT - 1;
        if (endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName =System.currentTimeMillis()+"-"+ boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "D:\\spring_img\\" + boardFileName;
        if(!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.save(boardDTO);
    }

    public BoardDTO findById(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.findById(id);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }



    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchMap = new HashMap<>();
        searchMap.put("searchType", searchType);
        searchMap.put("q", q);
        return boardRepository.search(searchMap);
    }


    public boolean update(BoardDTO boardDTO) {
        int result = boardRepository.update(boardDTO);
        if(result > 0){
            return true;
        }else {
            return false;
        }
    }

    public List<BoardDTO> findAllHits(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return boardRepository.findAllHits(pagingParam);
    }

    public List<BoardDTO> findAllNum(int page, int viewNum) {
        PAGE_LIMIT = viewNum;
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return boardRepository.findAll(pagingParam);
    }

    public PageDTO pagingNum(int page, int viewNum) {
        int boardCount = boardRepository.boardCount();
        PAGE_LIMIT = viewNum;
        int maxPage= (int) (Math.ceil((double) boardCount / PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if (endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
