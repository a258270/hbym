package com.cms4j.helper.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cms4j.helper.entity.Entity;
import com.cms4j.helper.entity.UrlEntity;
import com.cms4j.helper.entity.XmlEntity;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

public class HttpUtil {

    /**
     * 发送GET请求
     *
     * @param url
     *            目的地址
     *
     * @return 远程响应结果
     */
    public static JSONObject sendGetForJSONObject(String url) {
        return JSON.parseObject(sendGet(url));
    }

    public static JSONObject sendGetForJSONObject(String url, UrlEntity urlEntity) {
        return JSON.parseObject(sendGet(url, urlEntity));
    }

    /**
     * 发送GET请求
     *
     * @param url
     *            目的地址
     *
     * @return 远程响应结果
     */
    public static String sendGet(String url) {
        return sendGet(url, null);
    }
    /**
     * 发送GET请求
     *
     * @param url
     *            目的地址
     * @param urlEntity
     *            请求参数，UrlEntity类型。
     * @return 远程响应结果
     */
    public static String sendGet(String url, UrlEntity urlEntity) {
        String result="";
        BufferedReader in = null;// 读取响应输入流

        String full_url = url;//全URL
        try {
            if(urlEntity != null) {
                // 编码请求参数
                full_url += urlEntity;
            }
            // 打开URL连接
            HttpURLConnection httpConn = createConnection(full_url, urlEntity);
            httpConn.setRequestMethod("GET");
            // 建立实际的连接
            httpConn.connect();
            // 响应头部获取
            Map<String, List<String>> headers = httpConn.getHeaderFields();
            // 遍历所有的响应头字段
            /*for (String key : headers.keySet()) {
                System.out.println(key + "\t：\t" + headers.get(key));
            }*/
            // 定义BufferedReader输入流来读取URL的响应,并设置编码方式
            in = new BufferedReader(new InputStreamReader(httpConn
                    .getInputStream(), "UTF-8"));
            String line;
            // 读取返回的内容
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 发送POST请求
     *
     * @param url
     *            目的地址
     *
     * @return 远程响应结果
     */
    public static JSONObject sendPostForJSONObject(String url) {
        return JSON.parseObject(sendPost(url));
    }

    public static JSONObject sendPostForJSONObject(String url, Entity entity) {
        return JSON.parseObject(sendPost(url, entity));
    }

    /**
     * 发送POST请求
     *
     * @param url
     *            目的地址
     *
     * @return 远程响应结果
     */
    public static String sendPost(String url) {
        return sendPost(url, null);
    }
    /**
     * 发送POST请求
     *
     * @param url
     *            目的地址
     * @param entity
     *            请求参数，Entity类型。
     * @return 远程响应结果
     */
    public static String sendPost(String url, Entity entity) {
        String result = "";// 返回的结果
        BufferedReader in = null;// 读取响应输入流
        PrintWriter out = null;
        StringBuffer sb = new StringBuffer();// 处理请求参数
        String params = "";// 编码之后的参数
        try {
            // 编码请求参数
            if(!(entity instanceof XmlEntity))
                params = encodeParam(entity.getFieldsMap());
            else
                params += entity;
            //获取http连接
            HttpURLConnection httpConn = createConnection(url, entity);
            // 设置POST方式
            httpConn.setDoInput(true);
            httpConn.setDoOutput(true);
            // 获取HttpURLConnection对象对应的输出流
            out = new PrintWriter(httpConn.getOutputStream());
            // 发送请求参数
            if(!params.isEmpty())
                out.write(params);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应，设置编码方式
            in = new BufferedReader(new InputStreamReader(httpConn
                    .getInputStream(), "UTF-8"));
            String line;
            // 读取返回的内容
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    private static HttpURLConnection createConnection(String url, Entity entity) throws IOException {
        // 创建URL对象
        URL connURL = new URL(url);
        // 打开URL连接
        HttpURLConnection httpConn = (HttpURLConnection) connURL
                .openConnection();
        // 设置通用属性
        httpConn.setRequestProperty("Accept", "*/*");
        httpConn.setRequestProperty("Connection", "Keep-Alive");
        httpConn.setRequestProperty("User-Agent",
                "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)");

        if(entity instanceof XmlEntity) {
            httpConn.setRequestProperty("Content-Type","text/xml");
            httpConn.setRequestProperty("charset","utf-8");
        }


        return httpConn;
    }
    /**
     * 构造params字符串
     * @param parameters
     * @return
     * @throws UnsupportedEncodingException
     */
    private static String encodeParam(Map<String, String> parameters) throws UnsupportedEncodingException {
        StringBuffer sb = new StringBuffer();
        if(parameters.size()==1){
            for(String name:parameters.keySet()){
                sb.append(name).append("=").append(
                        URLEncoder.encode(parameters.get(name),
                                "UTF-8"));
            }
            return sb.toString();
        }else{
            for (String name : parameters.keySet()) {
                sb.append(name).append("=").append(
                        URLEncoder.encode(parameters.get(name),
                                "UTF-8")).append("&");
            }
            String temp_params = sb.toString();
            return temp_params.substring(0, temp_params.length() - 1);
        }
    }
}
