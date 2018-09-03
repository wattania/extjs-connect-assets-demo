Ext.define 'MainPanelUi',
  alias: 'widget.MainPanelUi'
  extend: 'Ext.panel.Panel'
  title: 'Main Panel'
  initComponent: ->
    console.log '--- initComponent ---'
    @callParent arguments
    

Ext.define 'MainPanel',
  extend: 'MainPanelUi'
  listeners:
    render: -> @bind()
  bind: ->
    console.log '- bind -'
