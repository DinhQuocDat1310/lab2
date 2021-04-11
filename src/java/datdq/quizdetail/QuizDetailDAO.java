/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.quizdetail;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import datdq.utilities.DBHelpers;

/**
 *
 * @author Asus
 */
public class QuizDetailDAO implements Serializable {

    public boolean insertNewQuizDetails(int quizID, int questionID, int answerID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO quizDetail(quizID, questionID, answerID) "
                        + "VALUES(?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quizID);
                ps.setInt(2, questionID);
                ps.setInt(3, answerID);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return false;
    }

    public boolean updateQuizDetail(int quizID, int questionID, int answerID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "UPDATE quizDetail SET answerID = ? "
                        + "WHERE quizID  = ? AND questionID = ? ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, answerID);
                ps.setInt(2, quizID);
                ps.setInt(3, questionID);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return false;
    }
}
