package com.microwarp.warden.stand.common.core.handler;

import com.microwarp.warden.stand.common.core.constant.Constants;
import com.microwarp.warden.stand.common.utils.WebUtil;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * wrapper - 防止重复提交InputStream构建
 * @author zhouwenqi
 */
public class RepeatedRequestWrapper extends HttpServletRequestWrapper {
    private final byte[] bytes;
    public RepeatedRequestWrapper(HttpServletRequest request,ServletResponse response) throws IOException {
        super(request);
        request.setCharacterEncoding(Constants.UTF8);
        response.setCharacterEncoding(Constants.UTF8);
        bytes = WebUtil.getBody(request).getBytes(Constants.UTF8);

    }
    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(getInputStream()));
    }
    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        return new ServletInputStream() {
            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {

            }

            @Override
            public int read() throws IOException {
                return byteArrayInputStream.read();
            }

            @Override
            public int available() throws IOException {
                return bytes.length;
            }
        };
    }
}
