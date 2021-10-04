package base.exceptionHandler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {

//    @ResponseStatus(value= HttpStatus.BAD_REQUEST)
    @ExceptionHandler(Exception.class)
    public ModelAndView handleUnknownException(HttpServletRequest request, Exception ex){
        ModelAndView model = new ModelAndView("errorPage");
        model.addObject("errorType", "unknown");
        model.addObject("url", request.getRequestURL());
        return model;
    }

//    @ResponseStatus(value= HttpStatus.NOT_FOUND, reason="Not found employee with this id")
    @ExceptionHandler(EmployeeNotFoundException.class)
    public ModelAndView handleEmployeeNotFoundException(EmployeeNotFoundException ex){
        ModelAndView model = new ModelAndView("errorPage");
        model.addObject("errorType", "employeeNotFound");
        model.addObject("id", ex.getId());
        return model;
    }
}
