package com.cms4j.helper.api.pay;

import com.cms4j.helper.entity.pay.Unifiedorder;
import com.cms4j.helper.util.SignUtil;
import org.junit.Test;

import static org.junit.Assert.*;

public class PayApiTest {
    @Test
    public void unifiedorder() throws Exception {
        Unifiedorder unifiedorder = new Unifiedorder();
        unifiedorder.setAttach("abc");
        unifiedorder.setAppid("ddd");
        unifiedorder.setMch_id("def");
        unifiedorder.setDetail("bbbb");

    }

}