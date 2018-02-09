package com.demo.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.app.model.Document;
import com.demo.app.repository.DocRepository;

@Service
public class DocServiceImpl implements DocService {

	@Autowired
	private DocRepository docRepository;

	@Override
	public List<Document> findAllDocs(Long id) {
		return docRepository.findUserDocs(id);
	}

}
