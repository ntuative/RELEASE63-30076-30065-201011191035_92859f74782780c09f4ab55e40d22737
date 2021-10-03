package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_589;
         param1["bitmap"] = const_714;
         param1["border"] = const_788;
         param1["border_notify"] = const_1464;
         param1["button"] = const_498;
         param1["button_thick"] = const_653;
         param1["button_icon"] = const_1314;
         param1["button_group_left"] = const_750;
         param1["button_group_center"] = const_664;
         param1["button_group_right"] = const_620;
         param1["canvas"] = const_762;
         param1["checkbox"] = const_611;
         param1["closebutton"] = const_899;
         param1["container"] = const_360;
         param1["container_button"] = const_566;
         param1["display_object_wrapper"] = const_643;
         param1["dropmenu"] = const_519;
         param1["dropmenu_item"] = const_523;
         param1["frame"] = const_366;
         param1["frame_notify"] = const_1355;
         param1["header"] = const_709;
         param1["icon"] = const_1058;
         param1["itemgrid"] = const_991;
         param1["itemgrid_horizontal"] = const_426;
         param1["itemgrid_vertical"] = const_627;
         param1["itemlist"] = const_1046;
         param1["itemlist_horizontal"] = const_363;
         param1["itemlist_vertical"] = const_368;
         param1["maximizebox"] = WINDOW_TYPE_MAXIMIZEBOX;
         param1["menu"] = const_1305;
         param1["menu_item"] = const_1450;
         param1["submenu"] = const_886;
         param1["minimizebox"] = const_1247;
         param1["notify"] = const_1228;
         param1["null"] = const_551;
         param1["password"] = const_555;
         param1["radiobutton"] = const_634;
         param1["region"] = const_780;
         param1["restorebox"] = const_1230;
         param1["scaler"] = const_591;
         param1["scaler_horizontal"] = const_1393;
         param1["scaler_vertical"] = const_1322;
         param1["scrollbar_horizontal"] = const_479;
         param1["scrollbar_vertical"] = const_690;
         param1["scrollbar_slider_button_up"] = const_1024;
         param1["scrollbar_slider_button_down"] = const_978;
         param1["scrollbar_slider_button_left"] = const_1011;
         param1["scrollbar_slider_button_right"] = const_925;
         param1["scrollbar_slider_bar_horizontal"] = const_1066;
         param1["scrollbar_slider_bar_vertical"] = const_884;
         param1["scrollbar_slider_track_horizontal"] = const_874;
         param1["scrollbar_slider_track_vertical"] = const_1019;
         param1["scrollable_itemlist"] = const_1294;
         param1["scrollable_itemlist_vertical"] = const_475;
         param1["scrollable_itemlist_horizontal"] = const_1084;
         param1["selector"] = const_612;
         param1["selector_list"] = const_649;
         param1["submenu"] = const_886;
         param1["tab_button"] = const_693;
         param1["tab_container_button"] = const_888;
         param1["tab_context"] = const_359;
         param1["tab_content"] = const_986;
         param1["tab_selector"] = const_629;
         param1["text"] = const_574;
         param1["input"] = const_569;
         param1["toolbar"] = const_1451;
         param1["tooltip"] = const_371;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
