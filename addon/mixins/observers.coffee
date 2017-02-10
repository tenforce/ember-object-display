`import Ember from 'ember'`

ObserversMixin = Ember.Mixin.create
  # Maybe still useful
  shouldHide: Ember.observer('object', 'hide', 'showEmpty', 'empty', () ->
    unless @get('model._shouldHide')
      if @get('hide') is true then @sendAction('handleHide', @, @get('index'))
      else if @get('empty') then unless @get 'showEmpty' then @sendAction('handleHide', @, @get('index'), @get('subject'))
  ).on('init')

`export default ObserversMixin`
