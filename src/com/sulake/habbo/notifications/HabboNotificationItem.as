package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_76:HabboNotificationItemStyle;
      
      private var var_166:String;
      
      private var _component:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_166 = param1;
         this.var_76 = param2;
         this._component = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_76;
      }
      
      public function get content() : String
      {
         return this.var_166;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_76.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this._component != null)
            {
               this._component.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
