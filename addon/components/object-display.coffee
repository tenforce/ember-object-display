`import Ember from 'ember'`
`import layout from '../templates/components/object-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ObjectDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout: layout
  defaultTagName: 'div'
  defaultClassNames: ['object-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false

  displayTitle: Ember.computed 'model.title', 'hideTitle', ->
    unless @get('model.title') then return false
    if @get('hideTitle') is true then return false
    true
  displayHeadings: Ember.computed 'model.headings', 'hideHeadings', ->
    unless @get('model.headings') then return false
    if @get('hideHeadings') is true then return false
    true
  actions:
    labelClicked: ->
      console.log "object display - label clicked"
      if @get('collapsible') then @toggleProperty('collapsed')
    valueClicked: ->
      console.log "object display - value clicked"
      if @get('collapsible') then @toggleProperty('collapsed')
    handleHideTitle: ->
      @set('hideTitle', true)
    handleHideHeadings: ->
      @set('hideHeadings', true)

`export default ObjectDisplayComponent`
