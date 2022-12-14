package service;

import domain.LoginDTO;
import domain.MemberVO;
import mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.MailUtils;
import util.TempKey;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Autowired
	private JavaMailSender mailSender;



	@Transactional
	@Override
	public void regist(MemberVO vo, String local) throws Exception {
		mapper.create(vo);
		String key = new TempKey().getKey(20);
		mapper.createAuth(vo.getEmail(), key);
		MailUtils mailUtils = new MailUtils(mailSender);
		mailUtils.setSubject("[당신의 인테리어에 대한 고민을 보다 쉽게! 인테리어 프렌드 인프! 인증 이메일 입니다.]");
		mailUtils.setText("" +
				"<h1>메일인증</h1>" +
				"<br/>"+vo.getNickName()+"님 "+
				"<br/>인테리어 프렌드 인프에 회원가입해주셔서 감사합니다."+
				"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
				"<a href='" + local + "/member/confirmEmail?email=" + vo.getEmail() +
				"&authKey=" + key +
				"' target='_blank'>이메일 인증 확인</a>");
		mailUtils.setFrom("admin@inf.com", "인프");
		mailUtils.setTo(vo.getEmail());
		mailUtils.send();

		String file = vo.getFullName();
		if(file == null) { return; }



	}
  
  @Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login(dto);
	}



	@Override
	public void keepLogin(String id, String sessionId, Date next) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);


		mapper.keepLogin(paramMap);

	}

	@Override
	public MemberVO checkLoginBefore(String value) {

		return mapper.checkMemberWithSessionKey(value);
	}
	@Override
	public MemberVO checkMemberWithSessionKey(String value) {
		return mapper.checkMemberWithSessionKey(value);
	}

	@Override
	public String findById(String id) throws Exception {
		String hashPw = mapper.findById(id);
		return hashPw;
	}


	@Override
	public void modify(MemberVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void remove(Integer memNo) throws Exception {
		mapper.delete(memNo);
	}

	


	@Override
	public int idCheck(String id) throws Exception {
		int cnt = mapper.idCheck(id);
		return cnt;
	}

	@Override
	public int nicknameCheck(String nickName) throws Exception{
		int cnt = mapper.nicknameCheck(nickName);
		return cnt;
	}

	@Override
	public void memberAuth(String email, String authKey) throws Exception {
		mapper.memberAuth(email, authKey);
	}

	@Override
	public List<String> getAttachImg(Integer memNo) throws Exception {
		return mapper.getAttachImg(memNo);
	}

	@Override
	public void deleteImg(Integer memNo) throws Exception {
		mapper.deleteImg(memNo);
	}

	@Override
	public void replaceImg(String fullName, Integer memNo) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("fullName", fullName);
		paramMap.put("memNo", memNo);

		mapper.replaceImg(paramMap);
	}



}

