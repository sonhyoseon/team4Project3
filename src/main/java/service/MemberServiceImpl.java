package service;


import domain.MemberVO;
import mapper.MemberMapper;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import util.MailUtils;
import util.TempKey;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import util.UploadFileUtils;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Autowired
	private JavaMailSender mailSender;



	@Transactional(rollbackFor = Exception.class)
	@Override
	public void regist(MemberVO vo) throws Exception {
		mapper.create(vo);
		String key = new TempKey().getKey(20);
		mapper.createAuth(vo.getEmail(), key);
		MailUtils mailUtils = new MailUtils(mailSender);
		mailUtils.setSubject("[당신의 인테리어에 대한 고민을 보다 쉽게! 인테리어 프렌드 인프! 인증 이메일 입니다.]");
		mailUtils.setText("" +
				"<h1>메일인증</h1>" +
				"<br/>"+vo.getNickname()+"님 "+
				"<br/>인테리어 프렌드 인프에 회원가입해주셔서 감사합니다."+
				"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
				"<a href='http://localhost:8080/users/confirmEmail?email=" + vo.getEmail() +
				"&authKey=" + key +
				"' target='_blank'>이메일 인증 확인</a>");
		mailUtils.setFrom("xogus8206@gmail.com", "인프");
		mailUtils.setTo(vo.getEmail());
		mailUtils.send();
	}



	@Override
	public void modify(MemberVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void remove(Integer memno) throws Exception {
		mapper.delete(memno);
	}

	@Override
	public String login(MemberVO vo, HttpSession session) throws Exception {
		mapper.login(vo);
		if(mapper != null){
			session.setAttribute("authUser", mapper);
		}
	return null;
	}

	@Override
	public void logout(HttpSession session) {

	}

	@Override
	public int idCheck(String id) throws Exception {
		int cnt = mapper.idCheck(id);
		return cnt;
	}


	@Override
	public void memberAuth(String email, String authKey) throws Exception {
		mapper.memberAuth(email, authKey);
	}

	@Override
	public void attachImg(String fileName) throws Exception {
		mapper.attachImg(fileName);
	}


}
