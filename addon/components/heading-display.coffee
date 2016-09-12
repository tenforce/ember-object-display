`import Ember from 'ember'`
`import layout from '../templates/components/heading-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

HeadingDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout: layout
  displayTitle: Ember.computed 'model.title', 'hideTitle', ->
    unless @get('model.title') then return false
    if @get('hideTitle') is true then return false
    true
  displayItems: Ember.computed 'model.items', 'hideItems', ->
    unless @get('model.items') then return false
    if @get('hideItems') is true then return false
    true
  actions:
    handleLabelClicked: (context) ->
      @get('helpers.labelClicked')(@)
    handleLoadingClicked: (context) ->
      @get('helpers.loadingClicked')(@)
    handleValueClicked: (context) ->
      @get('helpers.valueClicked')(@)
    handleHideTitle: ->
      @set('hideTitle', true)
    handleHideItems: ->
      @set('hideItems', true)

`export default HeadingDisplayComponent`
