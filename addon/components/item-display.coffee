`import Ember from 'ember'`
`import layout from '../templates/components/item-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ItemDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  defaultTagName: 'div'
  defaultClassNames: ['object-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false

  displayLabel: Ember.computed 'model.label', 'hideLabel', ->
    if @get('hideLabel') then return false
    if @get('model.label') then return true
    false
  displayLoading: Ember.computed 'model.loading', 'isLoading', ->
    if @get('hideLoading') then return false
    if @get('isLoading') then return true
    false

  labelIsLoaded: Ember.computed 'displayLabel', ->
    unless @get('displayLabel') then return true
    false
  targetIsLoaded: false
  isLoading: Ember.computed 'object', 'labelIsLoaded', 'targetIsLoaded', ->
    if @get('labelIsLoaded') and @get('targetIsLoaded') then return false
    true


  labelClicked: (context) ->
    if context.get 'collapsible'
      context.toggleProperty('collapsed')
    context.sendAction('handleLabelClicked', context)
  valueClicked: (context) ->
    context.sendAction('handleValueClicked', context)
  loadingClicked: (context) ->
    context.sendAction('handleValueClicked', context)
  actions:
    handleLabelClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.labelClicked')(@)
    handleLoadingClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.loadingClicked')(@)
    handleValueClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.valueClicked')(@)
    handleHideValue: (context, index) ->
      @set('targetIsLoaded', true)
      @set('empty', true)
    handleHideLabel: (context, index) ->
      @set('labelIsLoaded', true)
      @set('hideLabel', true)
    handleHideLoading: (context, index) ->
      @set('hideLoading', true)
    handleLoadedLabel: ->
      @set('labelIsLoaded', true)
    handleLoadedTarget: ->
      @set('targetIsLoaded', true)


`export default ItemDisplayComponent`
