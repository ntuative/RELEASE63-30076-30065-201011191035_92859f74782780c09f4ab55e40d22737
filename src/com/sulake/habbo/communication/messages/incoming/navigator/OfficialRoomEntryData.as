package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_933:int = 1;
      
      public static const const_654:int = 2;
      
      public static const const_752:int = 3;
      
      public static const const_1347:int = 4;
       
      
      private var _index:int;
      
      private var var_2136:String;
      
      private var var_2133:String;
      
      private var var_2135:Boolean;
      
      private var var_2137:String;
      
      private var var_855:String;
      
      private var var_2134:int;
      
      private var var_2131:int;
      
      private var _type:int;
      
      private var var_2138:String;
      
      private var var_792:GuestRoomData;
      
      private var var_793:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2136 = param1.readString();
         this.var_2133 = param1.readString();
         this.var_2135 = param1.readInteger() == 1;
         this.var_2137 = param1.readString();
         this.var_855 = param1.readString();
         this.var_2134 = param1.readInteger();
         this.var_2131 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_933)
         {
            this.var_2138 = param1.readString();
         }
         else if(this._type == const_752)
         {
            this.var_793 = new PublicRoomData(param1);
         }
         else if(this._type == const_654)
         {
            this.var_792 = new GuestRoomData(param1);
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_792 != null)
         {
            this.var_792.dispose();
            this.var_792 = null;
         }
         if(this.var_793 != null)
         {
            this.var_793.dispose();
            this.var_793 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2136;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2133;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2135;
      }
      
      public function get picText() : String
      {
         return this.var_2137;
      }
      
      public function get picRef() : String
      {
         return this.var_855;
      }
      
      public function get folderId() : int
      {
         return this.var_2134;
      }
      
      public function get tag() : String
      {
         return this.var_2138;
      }
      
      public function get userCount() : int
      {
         return this.var_2131;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_792;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_793;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_933)
         {
            return 0;
         }
         if(this.type == const_654)
         {
            return this.var_792.maxUserCount;
         }
         if(this.type == const_752)
         {
            return this.var_793.maxUsers;
         }
         return 0;
      }
   }
}
