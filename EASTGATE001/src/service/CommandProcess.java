package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {

	String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException ;

}
