`import Ember from 'ember'`

ObserversMixin = Ember.Mixin.create
  shouldHide: Ember.observer('hide', 'showEmpty', 'empty', () ->
    if @get('hide') is true then @sendAction('handleHide', @get('model'))
    else if @get('empty')
      unless @get 'showEmpty' then @sendAction('handleHide', @get('model'))
  ).on('init')

`export default ObserversMixin`
