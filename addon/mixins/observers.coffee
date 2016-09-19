`import Ember from 'ember'`

ObserversMixin = Ember.Mixin.create
  shouldHide: Ember.observer('object', 'hide', 'showEmpty', 'empty', () ->
    if @get('hide') is true then @sendAction('handleHide', @, @get('index'))
    else if @get('empty') then unless @get 'showEmpty' then @sendAction('handleHide', @, @get('index'))
  ).on('init')

`export default ObserversMixin`
