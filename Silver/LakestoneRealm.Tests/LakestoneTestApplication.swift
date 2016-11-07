import java.util
import android.app
import android.content
import android.os
import android.util
import android.view
import android.widget
import io.realm

public class LakestoneTestApplication: Application {
 
	public override func onCreate(){
		super.onCreate()		
		Realm.`init`(self)
	
	}
}

