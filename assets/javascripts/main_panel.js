//= require main_panel_ui

Ext.define('MainPanel', {
  extend: 'MainPanelUi',
  count: 0,
  listeners: {
    render: function() {
      return this.bind();
    }
  },
  bind: function() {
    var buttonClickMe, displayCount, me;
    me = this;
    
    ({buttonClickMe, displayCount} = this.fetchComponents());
    
    buttonClickMe.on('click', function(cmp) {
      me.count += 1;
      displayCount.setValue(me.count);
    });
  }
});
