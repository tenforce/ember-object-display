`import Ember from 'ember'`

ObserversMixin = Ember.Mixin.create
  shouldHide: Ember.observer('object', 'hide', 'showEmpty', 'empty', () ->
    unless @get('model._shouldHide')
      if @get('hide') is true then @sendAction('handleHide', @, @get('index'))
      else if @get('empty') then unless @get 'showEmpty' then @sendAction('handleHide', @, @get('index'), @get('subject'))
  ).on('init')

  cleanState: () ->
    false
  backupmodel: undefined
  copyModel: Ember.observer('object', () ->
    @cleanState()
    backupmodel = @get('backupmodel')
    if backupmodel then @set('model', JSON.parse(JSON.stringify(backupmodel)))
    else @set('backupmodel', JSON.parse(JSON.stringify(@get('model'))))
  ).on('init')

`export default ObserversMixin`
