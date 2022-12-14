package controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate);


        return "main/index";
    }

    @RequestMapping(value = "/main/introduce", method = RequestMethod.GET)
    public void introduce() throws Exception {

    }


    @RequestMapping(value = "/notice/faq", method = RequestMethod.GET)
    public String faq(Locale locale, Model model) {
        return "/notice/faq";

    }

    @RequestMapping(value = "/users/notAdmin", method = RequestMethod.GET)
    public String notAdmin(Locale locale, Model model) {
        return "/users/notAdmin";

    }


    @RequestMapping(value = "/users/notLogin", method = RequestMethod.GET)
    public String notLogin(Locale locale, Model model) {
        return "/users/notLogin";

    }

}
