`import Ember from 'ember'`
`import layout from '../templates/components/loading-default'`

LoadingDefaultComponent = Ember.Component.extend
  # DEPRECATED
  layout:layout
  click: ->
    @sendAction('clicked', @)
    false

  didRender: ->
    @._super()
    @set('empty', false)
    @set('isLoading', false)

  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false then @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

`export default LoadingDefaultComponent`
