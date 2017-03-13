package com.example.gridviewtest1;

import java.util.Random;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.pm.LabeledIntent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.TextView;

public class MainActivity extends Activity {

	TextView textView;
	GridView gridView;
	String [] items = {"한국","미국","캐나다","스페인","이탈리아","독일","이스라엘","호주","보라카이","영국","프랑스","스웨덴","덴마크","인도","멕시코","남아공","두바이","일본","중국","몽골","체코","필리핀","브라질"};
	
	
	private class FunnyLookingAdapter extends ArrayAdapter<String> 
	{
		
		Context context;
		public FunnyLookingAdapter(Context ctx, int resource, String []items) {
			// TODO Auto-generated constructor stub
			super(ctx, resource,items);
			this.context=ctx;
		}
		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			// TODO Auto-generated method stub
			TextView label = (TextView)convertView;
			
			if(convertView==null)
			{
				convertView=new TextView(context);
				label=(TextView)convertView;
			}
			
			
			label.setText(items[position]);
			Random r = new Random();
			label.setTextColor(Color.rgb(r.nextInt(256), r.nextInt(256), r.nextInt(256)));
			return convertView;
		}

	
		
		
		
	}
	
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		textView = (TextView)findViewById(R.id.textView1);
		gridView = (GridView)findViewById(R.id.gridView1);
		gridView.setAdapter(new FunnyLookingAdapter(this, android.R.layout.simple_list_item_1, items));
		
		gridView.setOnItemClickListener(new OnItemClickListener() {
		
			@Override
			public void onItemClick(AdapterView<?> parent, View v, int position,
					long id) {
				// TODO Auto-generated method stub
				textView.setText(items[position]);
				
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
