package com.demo.app.service;

import java.util.List;

import com.demo.app.model.Document;

public interface DocService {

	List<Document> findAllDocs(Long id);

}
