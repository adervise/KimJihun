package com.example.webviewtest;

import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.view.KeyEvent;
import android.view.Menu;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {

	WebView browser;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        browser=(WebView)findViewById(R.id.web);
        //browser.loadUrl("http://m.naver.com");
        
//        String msg="<html><body>Hello World!<br><h1>HTML</h1></body></html>";
//        browser.loadDataWithBaseURL(null, msg, "text/html","UTF-8", null);
        
        //����Ǿ� �ִ� html �� �о webview �� ǥ���ϱ�
        browser.loadUrl("file:///android_asset/test1.html");
        	
        browser.setWebViewClient(new MyWebClient());
         WebSettings set=browser.getSettings();
         set.setJavaScriptEnabled(true);
         set.setBuiltInZoomControls(true);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
    	// TODO Auto-generated method stub
    	//ȭ�� �����丮�� �о�鿩 ���� �������� �����ϸ� ������������ �̵�
    	if(keyCode==KeyEvent.KEYCODE_BACK && browser.canGoBack())
    		browser.goBack();
    	//ȭ�� �����丮�� �о�鿩 ���� �������� �������� ������
    	else if(keyCode==KeyEvent.KEYCODE_BACK &&
    				!browser.canGoBack()){
    		new AlertDialog.Builder(this)
    		.setTitle("����Ȯ��")
    		.setMessage("�����Ͻðڽ��ϱ�?")
    		.setPositiveButton("��", new DialogInterface.OnClickListener()
    		{				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					finish();					
				}
			})
			.setNegativeButton("�ƴϿ�", new DialogInterface.OnClickListener()
    		{				
				@Override
				public void onClick(DialogInterface dialog, int which) {				
				}
			}).show();
    	}
    		
    	return true;
    }

    class MyWebClient extends WebViewClient
    {
    	@Override
    	public boolean shouldOverrideUrlLoading(WebView view,
    			String url) {
    		// TODO Auto-generated method stub
    		view.loadUrl(url);
    		return true;
    	}
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
