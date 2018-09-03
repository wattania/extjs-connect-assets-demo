#= require main_panel

Ext.onReady ->
  console.log '-- ready --'
  Ext.create 'Ext.container.Viewport',
    layout:
      type: 'fit'
    items: [
      Ext.create 'MainPanel',
        flex: 1
    ]