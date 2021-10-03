package com.sulake.habbo.quest
{
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.ActivateQuestMessageComposer;
   import flash.utils.Dictionary;
   
   public class QuestController
   {
       
      
      private var var_216:HabboQuestEngine;
      
      private var _campaigns:Dictionary;
      
      private var var_284:QuestCampaign;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         this._campaigns = new Dictionary();
         super();
         this.var_216 = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._campaigns)
         {
            _loc1_.dispose();
         }
         this._campaigns = null;
      }
      
      private function reset() : void
      {
         if(this.var_284)
         {
            this.var_284.dispose();
            this.var_284 = null;
         }
      }
      
      public function isVisible() : Boolean
      {
         return this.var_284 != null && this.var_284.isVisible();
      }
      
      public function close() : void
      {
         if(this.var_284)
         {
            this.var_284.close();
         }
      }
      
      public function questAccepted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this._campaigns[param1];
         if(_loc3_)
         {
            _loc3_.questAccepted(param2);
         }
      }
      
      public function questCompleted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this._campaigns[param1];
         if(_loc3_)
         {
            _loc3_.questCompleted(param2);
         }
      }
      
      public function activateQuest(param1:Quest) : void
      {
         if(param1)
         {
            this.var_216.communication.getHabboMainConnection(null).send(new ActivateQuestMessageComposer(param1.id));
         }
      }
      
      public function get questEngine() : HabboQuestEngine
      {
         return this.var_216;
      }
      
      public function openCampaign(param1:String, param2:int, param3:Array) : void
      {
         var _loc4_:* = this._campaigns[param1];
         if(_loc4_)
         {
            _loc4_.dispose();
            _loc4_ = null;
            delete this._campaigns[param1];
         }
         _loc4_ = new QuestCampaign(this,param1,param2);
         this._campaigns[param1] = _loc4_;
         this.var_284 = _loc4_;
         this.var_284.openCampaign(param3);
      }
      
      public function updatePurse() : void
      {
         if(!this.var_284)
         {
            return;
         }
         this.var_284.updatePurse();
      }
   }
}
