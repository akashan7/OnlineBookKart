package com.dao;

import com.model.ContactUs;
import java.sql.ResultSet;

/**
 *
 * @author hackey.jay
 */
public interface IContactUs {
    int setContact(ContactUs contact,int userId);
    ResultSet getContact();
}
