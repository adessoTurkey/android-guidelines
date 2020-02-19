package ${escapeKotlinIdentifiers(rootPackage)}.${packagePathName}.${classNameLowercase}

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import ${escapeKotlinIdentifiers(rootPackage)}.R
import ${escapeKotlinIdentifiers(rootPackage)}.base.BaseBindingActivity
import ${escapeKotlinIdentifiers(rootPackage)}.databinding.Activity${classNameCap}Binding

class ${classNameCap}Activity : BaseBindingActivity<${classNameCap}ViewModel, Activity${classNameCap}Binding>() {

    override val layoutId = R.layout.${activityName}

    companion object {

        fun launch(activity: AppCompatActivity) =
                activity.apply {
                    startActivity(Intent(this, ${classNameCap}Activity::class.java))
                    finish()
                }
    }
}
