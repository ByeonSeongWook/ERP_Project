package com.erp.exception;

import java.nio.file.AccessDeniedException;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class PageException {
//	// 모든 예외 상황에 대해서 처리 404 제외
//		@ExceptionHandler(Exception.class)
//		public String allException(Exception e) {
//			return "error/error";
//		}
		
//	    // 각각의 예외 상황에 따라 처리
//		@ExceptionHandler(RuntimeException.class)
//		public String runtimeException(Exception e) {
//			return "error/error";
//		}
		
//	    // 한번에 여러개의 예외 상황 처리
//		@ExceptionHandler({RuntimeException.class, AccessDeniedException.class})
//		public String accessDeniedException(Exception e) {
//			return "error/errorPage401";
//		}
		
	    // 404에 따른 에러 처리
		@ExceptionHandler(NoHandlerFoundException.class)
		public String notFoundException(Exception e) {
			return "error/errorPage404";
		}
		
//	    // ResponseStatus를 사용하여 예외처리
//	    // ResponseStatus는 한번에 하나의 HttpStatus만 가능
//		@ResponseStatus(HttpStatus.BAD_GATEWAY)
//		public String forbiddenException(Exception e, Model m) {
//		
//			return "error/errorPage405";
//		}
		
}
