package edu.calvin.cs262.llw5;

//import statements
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private int mCount =0;
    private TextView mShowCount;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mShowCount = (TextView) findViewById(R.id.show_count);
    }

    public void showToast(View view) {
        /** a method to show the toast message
         * <p>
         *     This method takes the value stored at toast_message and displays it.
         * </p>
         *
         * @return void
         */
        Toast toast = Toast.makeText(this, R.string.toast_message,
                Toast.LENGTH_SHORT);
        toast.show();
    }

    public void countUp(View view) {
        /** a method to incriment the toast count
         * <p>
         *     This method incriments the mCount and then calls the setText method to display the new mCount
         * </p>
         * @return void
         */
        mCount++;
        if (mShowCount != null)
            mShowCount.setText(Integer.toString(mCount));

    }
}
