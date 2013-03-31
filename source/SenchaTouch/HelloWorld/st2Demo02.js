
var helloworld = {
  onHideButtonTapped: function() {
    Ext.Msg.alert('Attention!', 'You clicked the Hide button!', Ext.emptyFn);
    Ext.getCmp("bottomToolbar").hide();
    Ext.getCmp("hideButton").hide();
    Ext.getCmp("showButton").show();
    },
  onShowButtonTapped: function() {
    Ext.Msg.alert('Attention!', 'You clicked the Show button!', Ext.emptyFn);
    Ext.getCmp("bottomToolbar").show();
    Ext.getCmp("hideButton").show();
    Ext.getCmp("showButton").hide();
    }

};
