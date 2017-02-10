package com.example.networkstatetest;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

	Button btn;
	TextView status;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn=(Button)findViewById(R.id.button1);
        status=(TextView)findViewById(R.id.status);
        btn.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				ConnectivityManager cm=(ConnectivityManager)
						getSystemService(Context.CONNECTIVITY_SERVICE);
				NetworkInfo ni=
						cm.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
				
				boolean isWifiAvail=ni.isAvailable();//연결 가능 여부
				boolean isWifiConn=ni.isConnected();//현재 연결 여부
				
				ni=cm.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
				boolean isMobileAvail=ni.isAvailable();
				boolean isMobileConn=ni.isConnected();
				
				status.setText("Wifi\n연결가능="+isWifiAvail+
						"\n연결="+isWifiConn+"\nMobile\n연결가능="+
						isMobileAvail+"\n연결="+isMobileConn);				
			}
		});
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
