package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_751:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_1987:int;
      
      private var var_1984:int;
      
      private var _color:uint;
      
      private var var_1120:int;
      
      private var var_2180:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_751);
         this.var_1987 = param1;
         this.var_1984 = param2;
         this._color = param3;
         this.var_1120 = param4;
         this.var_2180 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_1987;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_1984;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1120;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2180;
      }
   }
}
