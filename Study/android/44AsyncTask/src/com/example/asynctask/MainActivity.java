package com.example.asynctask;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
/*
 * AsyncTask :다중작업 기술중 하나인 멀티스레드,그중 UI에 관한 작업에 대해
 * 쉽게 멀티스레딩이 가능하게 해주는 기술이다
 * AsyncTask 는 한클래스 안에서 UI작업과 비지니스 로직 처리가
 * 모두 가능하기 때문에 간편하다
 * 사용예: 다운로드나 로그인 등등 UI와 로직이 같이 실행되야 하는 경우는
 * 거의 AsyncTask 를 사용한다고 할수 있다
 * AsyncTask 는 내부 클래스를 이용해서 구현한다
 */
public class MainActivity extends Activity {

	int mValue;
	TextView mText;
	Button btn;
	ProgressDialog mProgress;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        mText=(TextView)findViewById(R.id.textView1);
        btn=(Button)findViewById(R.id.button1);
        
        btn.setOnClickListener(new OnClickListener() {			
			@Override
			public void onClick(View v) {
				new AccumulateTask().execute();
			}
		});
    }

    //AsyncTask 내부 클래스
    class AccumulateTask extends AsyncTask<Integer, Integer, Integer>
    {
    	/* onPreExecute 는
		 doInBackground 메소드가 백그라운드에서 실행되기 직전에 호출,
		 초기화하거나 백그라운드가 실행되기 전에 처리할 코드들을 이곳에서
		 주면 된다
		 */
		@Override
		protected void onPreExecute() {
			Log.i("MyTag","onPreExecute");
			mValue=0;
			mProgress=new ProgressDialog(MainActivity.this);
			mProgress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
			mProgress.setTitle("Downloading...");
			mProgress.setMessage("Wait....");
			mProgress.setCancelable(false);
			mProgress.setProgress(0);
			mProgress.setButton(DialogInterface.BUTTON_NEUTRAL,
					"Cancel",
					new DialogInterface.OnClickListener() {						
						@Override
						public void onClick(DialogInterface dialog, int which) {
							// TODO Auto-generated method stub
							cancel(true);
						}
					});
			mProgress.show();
		}
		/*
		 doInBackground 는 지정된 작업을 마칠때까지 백그라운드에서
		 계속 실행
		 */
		@Override
		protected Integer doInBackground(Integer... params) {
			Log.i("MyTag","doInBackground");
			
			while (isCancelled()==false) {
				mValue++;
				if(mValue<=100)
					publishProgress(mValue);
				else
					break;
				
				try {
					Thread.sleep(50);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return mValue;
		}

		@Override
		protected void onCancelled() {
			Log.i("MyTag","onCancelled");
			mProgress.dismiss();//창닫기
		}

		@Override
		protected void onPostExecute(Integer result) {
			Log.i("MyTag","onPostExecute");
			mProgress.dismiss();//창닫기
		}

		/*
		 * onProgressUpdate 는
		   doInBackground 에서 publishProgress 를 호출하면
		   인자로 넘긴값을 받아 호출된다
		 */
		@Override
		protected void onProgressUpdate(Integer... values) {
			Log.i("MyTag","onProgressUpdate");
			
			//화면 View 에 데이타 반영
			mProgress.setProgress(values[0]);
			mText.setText(String.valueOf(values[0]));
		}    	
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
