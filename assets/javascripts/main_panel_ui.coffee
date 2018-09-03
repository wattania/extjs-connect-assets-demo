Ext.define 'MainPanelUi',
  extend: 'Ext.panel.Panel'
  title: 'Main Panel'
  bodyPadding: 10
  fetchComponents: ->
    ret = 
      buttonClickMe: @down 'button[name=click_me]'
      displayCount:  @down 'displayfield'
  initComponent: ->
    console.log '--- initComponent ---'
    @createItems()
    @callParent arguments
  
  createItems: ->
    @items = [
      xtype: 'displayfield'
      name: 'count'
      value: 0
    ,
      xtype: 'button'
      text: 'Click Me'
      name: 'click_me'
    ]