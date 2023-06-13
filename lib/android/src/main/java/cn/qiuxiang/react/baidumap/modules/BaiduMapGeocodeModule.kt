package cn.qiuxiang.react.baidumap.modules

import android.widget.Toast
import cn.qiuxiang.react.baidumap.toWritableMap
import com.baidu.mapapi.search.core.SearchResult
import com.baidu.mapapi.search.poi.*
import com.facebook.react.bridge.*
import org.json.JSONArray




//百度sdk 用kt写总是崩溃，拿出来单独写
@Suppress("unused")
class BaiduMapGeocodeModule(context: ReactApplicationContext) : ReactContextBaseJavaModule(context) {
    private var promise: Promise? = null

//    private val geoCoder by lazy {
//        val geoCoder = PoiSearch.newInstance();
//        var listener = geoCoder.setOnGetPoiSearchResultListener(
//            object : OnGetPoiSearchResultListener {
//                override fun onGetPoiResult(p0: PoiResult?) {
//                    TODO("Not yet implemented")
//                }
//
//                override fun onGetPoiDetailResult(p0: PoiDetailResult?) {
//                    TODO("Not yet implemented")
//                }
//
//                override fun onGetPoiDetailResult(p0: PoiDetailSearchResult?) {
//                    TODO("Not yet implemented")
//                }
//
//                override fun onGetPoiIndoorResult(p0: PoiIndoorResult?) {
//                    TODO("Not yet implemented")
//                }
//
//            } )
//        geoCoder
//    }

    override fun getName(): String {
        return "BaiduMapGeocode"
    }

    override fun canOverrideExistingModule(): Boolean {
        return true
    }

//    @ReactMethod
//    fun search( obj:ReadableArray, promise: Promise) {
//        if (this.promise == null) {
//            this.promise = promise
//            /**
//             *  PoiCiySearchOption 设置检索属性
//             *  city 检索城市
//             *  keyword 检索内容关键字
//             *  pageNum 分页页码
//             */
//            /**
//             * PoiCiySearchOption 设置检索属性
//             * city 检索城市
//             * keyword 检索内容关键字
//             * pageNum 分页页码
//             */
//
//              val array: WritableArray? = Arguments.createArray()
//               var arr: JSONArray? = null
//                arr = JSONArray(obj.toString())
//                val jsonObject = arr!!.optJSONObject(0)
////        JSONObject jsonObject = new JSONObject(String.valueOf(object));
//                //        JSONObject jsonObject = new JSONObject(String.valueOf(object));
//                val types = jsonObject.getString("types")
//                val keywords = jsonObject.getString("keywords")
//                val city = jsonObject.getString("city")
//                geoCoder.searchInCity(
//                    PoiCitySearchOption()
//                        .city(city) //必填
//                        .keyword(keywords).tag(types).cityLimit(false) //必填
//                        .pageNum(0)
//                )
//
////            geoCoder.geocode(GeoCodeOption().address(address).city(city))
//        } else {
//            promise.reject("", "This callback type only permits a single invocation from native code")
//        }
//    }
//
//    @ReactMethod
//    fun reverse(coordinate: ReadableMap, promise: Promise) {
//        if (this.promise == null) {
//            this.promise = promise
//            geoCoder.destroy();
////            geoCoder.reverseGeoCode(ReverseGeoCodeOption().location(coordinate.toLatLng()))
//        } else {
//            promise.reject("", "This callback type only permits a single invocation from native code")
//        }
//    }
}
