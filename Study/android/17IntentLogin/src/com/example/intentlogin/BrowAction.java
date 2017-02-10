package com.example.intentlogin;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class BrowAction extends Activity{

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.browform);
		WebView webview=(WebView)findViewById(R.id.webView1);
		//webview.loadUrl("http://m.nate.com");
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html><body>");
		sb.append("<h2>hello J to the Hun</h2>");
		sb.append("<a href='http://m.nate.com'>NATE</a><br>");
		sb.append("<a href='http://m.naver.com'>NAVER</a><br>");
		sb.append("</body></html>");
		webview.loadData(sb.toString(), "text/html", "UTF-8");
	}
}
