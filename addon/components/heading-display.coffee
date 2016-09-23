`import Ember from 'ember'`
`import layout from '../templates/components/heading-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

HeadingDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout: layout
  defaultTagName: 'div'
  defaultClassNames: ['heading-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false

  displayTitle: Ember.computed 'model.title', 'hideTitle', ->
    unless @get('model.title') then return false
    if @get('hideTitle') is true then return false
    true
  displayItems: Ember.computed 'model.items', 'hideItems', ->
    unless @get('model.items') then return false
    if @get('hideItems') is true then return false
    true

  checkEmptyItems: Ember.observer('object', 'model.items', 'hideItems', 'collapsed', () ->
    items = @get('model.items')
    unless items then @set('empty', true)
    else if @get('hideItems') then @set('empty', true)
  ).on('init')
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
