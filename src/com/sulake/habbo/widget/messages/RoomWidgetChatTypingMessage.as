package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_560:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_815:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_560);
         this.var_815 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_815;
      }
   }
}
