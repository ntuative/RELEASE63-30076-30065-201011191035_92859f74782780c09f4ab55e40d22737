package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage
   {
      
      public static const const_347:String = "RWCM_OPEN_AVATAR_EDITOR";
      
      public static const const_1341:String = "RWCM_GET_WARDROBE";
      
      public static const const_706:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";
       
      
      private var var_17:IWindowContainer;
      
      public function RoomWidgetAvatarEditorMessage(param1:String, param2:IWindowContainer = null)
      {
         super(param1);
         this.var_17 = param2;
      }
      
      public function get context() : IWindowContainer
      {
         return this.var_17;
      }
   }
}
