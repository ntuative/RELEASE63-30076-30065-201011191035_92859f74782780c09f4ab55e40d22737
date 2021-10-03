package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_320:int;
      
      private var var_2131:int;
      
      private var var_2140:Boolean;
      
      private var var_2087:int;
      
      private var _ownerName:String;
      
      private var var_105:RoomData;
      
      private var var_658:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_320 = param1.readInteger();
         this.var_2131 = param1.readInteger();
         this.var_2140 = param1.readBoolean();
         this.var_2087 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_105 = new RoomData(param1);
         this.var_658 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_105 != null)
         {
            this.var_105.dispose();
            this.var_105 = null;
         }
         if(this.var_658 != null)
         {
            this.var_658.dispose();
            this.var_658 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_320;
      }
      
      public function get userCount() : int
      {
         return this.var_2131;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2140;
      }
      
      public function get ownerId() : int
      {
         return this.var_2087;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_105;
      }
      
      public function get event() : RoomData
      {
         return this.var_658;
      }
   }
}
