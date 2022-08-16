package service;

import java.util.List;

import domain.CboardVO;
import domain.CbCriteria;

public interface CboardService {

    public void writeCboard(CboardVO cboard) throws Exception;

    public CboardVO readCboard(Integer cbno) throws Exception;

    public List<CboardVO> listCboard(CbCriteria cri) throws Exception;

    public int listCount() throws Exception;

    public void modifyCboard(CboardVO cboard) throws Exception;

    public void deleteCboard(int cbno) throws Exception;

    public void addAttach(String fullName)throws Exception;

    public List<String> getAttach(Integer cbno)throws Exception;

    public void deleteAttach(Integer cbno)throws Exception;

    public void replaceAttach(String fullName, Integer cbno)throws Exception;

}