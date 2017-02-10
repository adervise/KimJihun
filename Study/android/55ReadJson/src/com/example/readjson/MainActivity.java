package com.example.readjson;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.json.JSONArray;
import org.json.JSONObject;

import android.os.Bundle;
import android.app.Activity;
import android.content.res.AssetManager;
import android.content.res.AssetManager.AssetInputStream;
import android.view.Menu;
import android.widget.TextView;

public class MainActivity extends Activity {

	TextView text;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		text=(TextView)findViewById(R.id.text);
		//assets 폴더 정보 읽어오기
		AssetManager assetManager = getResources().getAssets();
		
		try {
			//사용하고자 하는 json 파일 읽어오기
			AssetInputStream ais = (AssetInputStream)assetManager.open("sample.json");
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(ais,"utf-8"));
			StringBuffer sb = new StringBuffer();
			String result = null;
			
			while((result=br.readLine())!=null)
			{
				sb.append(result);
			}
			//JSONOBJECT 객체 생성
			JSONObject jsonObject = new JSONObject(sb.toString());
			String menu = jsonObject.getString("menu");
			text.setText(menu+"\n");
			
			//JSONArray 객체 생성
			JSONArray jArray =
					new JSONArray(jsonObject.getString("member"));
			
			for(int i=0; i<jArray.length(); i++)
			{
				text.append("=================\n");
				text.append("ID"+jArray.getJSONObject(i).getString("id")+"\n");
				text.append("NAME"+jArray.getJSONObject(i).getString("name")+"\n");
				text.append("Address"+jArray.getJSONObject(i).getString("address")+"\n");
				text.append("Job"+jArray.getJSONObject(i).getString("job")+"\n");
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
