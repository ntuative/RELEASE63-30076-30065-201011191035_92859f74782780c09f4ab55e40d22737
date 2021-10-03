package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2647:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_129 = param1.desktop;
         var_77 = param1.var_1136 as WindowController;
         _lastClickTarget = param1.var_1138 as WindowController;
         var_138 = param1.renderer;
         var_745 = param1.var_1137;
         param2.begin();
         param2.end();
         param1.desktop = var_129;
         param1.var_1136 = var_77;
         param1.var_1138 = _lastClickTarget;
         param1.renderer = var_138;
         param1.var_1137 = var_745;
      }
   }
}
