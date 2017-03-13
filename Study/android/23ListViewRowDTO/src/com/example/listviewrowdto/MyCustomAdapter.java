package com.example.listviewrowdto;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class MyCustomAdapter extends BaseAdapter {

	Context context;
	int layout;
	ArrayList<MyCustomDTO> list;
	LayoutInflater inf;
	
	public MyCustomAdapter(Context context, int layout,
			ArrayList<MyCustomDTO> list) {
		super();
		this.context = context;
		this.layout = layout;
		this.list = list;
	

	inf=(LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return list.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return list.get(position);//행번호 리턴
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View view, ViewGroup parent) {
		// TODO Auto-generated method stub
		if(view==null)
			view=inf.inflate(layout, null);
		
		TextView txtTitle=(TextView)view.findViewById(R.id.txtTitle);
		TextView txtContent=(TextView)view.findViewById(R.id.txtContent);
		ImageView imgIcon=(ImageView)view.findViewById(R.id.imageIcon);
		
		MyCustomDTO dto=list.get(position);
		txtTitle.setText(dto.getTitle());
		txtContent.setText(dto.getContent());
		imgIcon.setImageResource(dto.getImgIcon());
		
		
		return view;
	}
	
	
	
	
}
