package com.its.memberBoard.service;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
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
}
