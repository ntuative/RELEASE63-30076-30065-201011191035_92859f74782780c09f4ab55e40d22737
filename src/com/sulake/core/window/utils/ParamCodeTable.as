package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_160;
         param1["bound_to_parent_rect"] = const_95;
         param1["child_window"] = const_957;
         param1["embedded_controller"] = const_938;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_46;
         param1["internal_event_handling"] = const_747;
         param1["mouse_dragging_target"] = const_242;
         param1["mouse_dragging_trigger"] = const_311;
         param1["mouse_scaling_target"] = const_283;
         param1["mouse_scaling_trigger"] = const_478;
         param1["horizontal_mouse_scaling_trigger"] = const_219;
         param1["vertical_mouse_scaling_trigger"] = const_245;
         param1["observe_parent_input_events"] = const_922;
         param1["optimize_region_to_layout_size"] = const_454;
         param1["parent_window"] = const_1071;
         param1["relative_horizontal_scale_center"] = const_183;
         param1["relative_horizontal_scale_fixed"] = const_117;
         param1["relative_horizontal_scale_move"] = const_334;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_901;
         param1["relative_scale_fixed"] = const_576;
         param1["relative_scale_move"] = const_1008;
         param1["relative_scale_strech"] = const_1080;
         param1["relative_vertical_scale_center"] = const_181;
         param1["relative_vertical_scale_fixed"] = const_125;
         param1["relative_vertical_scale_move"] = const_315;
         param1["relative_vertical_scale_strech"] = const_342;
         param1["on_resize_align_left"] = const_590;
         param1["on_resize_align_right"] = const_391;
         param1["on_resize_align_center"] = const_453;
         param1["on_resize_align_top"] = const_671;
         param1["on_resize_align_bottom"] = const_429;
         param1["on_resize_align_middle"] = const_500;
         param1["on_accommodate_align_left"] = const_906;
         param1["on_accommodate_align_right"] = const_505;
         param1["on_accommodate_align_center"] = const_606;
         param1["on_accommodate_align_top"] = const_892;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_633;
         param1["route_input_events_to_parent"] = const_521;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_916;
         param1["scalable_with_mouse"] = const_1015;
         param1["reflect_horizontal_resize_to_parent"] = WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT;
         param1["reflect_vertical_resize_to_parent"] = const_459;
         param1["reflect_resize_to_parent"] = const_260;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
