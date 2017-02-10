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
        
        //내장되어 있는 html 을 읽어서 webview 에 표시하기
        browser.loadUrl("file:///android_asset/test1.html");
        	
        browser.setWebViewClient(new MyWebClient());
         WebSettings set=browser.getSettings();
         set.setJavaScriptEnabled(true);
         set.setBuiltInZoomControls(true);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
    	// TODO Auto-generated method stub
    	//화면 히스토리를 읽어들여 이전 페이지가 존재하면 이전페이지로 이동
    	if(keyCode==KeyEvent.KEYCODE_BACK && browser.canGoBack())
    		browser.goBack();
    	//화면 히스토리를 읽어들여 이전 페이지가 존재하지 않으면
    	else if(keyCode==KeyEvent.KEYCODE_BACK &&
    				!browser.canGoBack()){
    		new AlertDialog.Builder(this)
    		.setTitle("종료확인")
    		.setMessage("종료하시겠습니까?")
    		.setPositiveButton("예", new DialogInterface.OnClickListener()
    		{				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					finish();					
				}
			})
			.setNegativeButton("아니오", new DialogInterface.OnClickListener()
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
