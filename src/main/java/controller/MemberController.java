package controller;

import domain.LoginVO;
import domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MemberService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Inject
    private MemberService service;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void loginGET(@ModelAttribute("vo") LoginVO vo) {

    }

    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginVO vo, HttpSession session, Model model) throws Exception {

        MemberVO member = service.login(vo);

        if (vo == null) {
            return;
        }

        model.addAttribute("member", member);

    }

}