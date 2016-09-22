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

  backupmodel: undefined
  copyModel: Ember.observer('object', () ->
    backupmodel = @get('backupmodel')
    if backupmodel then @set('model', JSON.parse(JSON.stringify(backupmodel)))
    else @set('backupmodel', JSON.parse(JSON.stringify(@get('model'))))
  ).on('init')

  displayTitle: Ember.computed 'model.title', 'hideTitle', ->
    unless @get('model.title') then return false
    if @get('hideTitle') is true then return false
    true
  displayHeadings: Ember.computed 'model.headings', 'hideHeadings', ->
    unless @get('model.headings') then return false
    if @get('hideHeadings') is true then return false
    true
  inheritedHelpers:
    collapse: (context) ->
      if context.get('collapsible') then context.toggleProperty('collapsed')
      else if context?.get('log') then console.log("collapse / expand ignored")
    prefixClicked: (context) ->
      if context.get('prefixClicked') then context.get('prefixClicked')(context)
      else context.get('helpers.collapse')(context)
    suffixClicked: (context) ->
      if context.get('suffixClicked') then context.get('suffixClicked')(context)
      else context.get('helpers.collapse')(context)
    labelClicked: (context) ->
      if context.get('labelClicked') then context.get('labelClicked')(context)
      else context.get('helpers.collapse')(context)
    loadingClicked: (context) ->
      console.log "loading clicked"
      if context.get('loadingClicked') then context.get('loadingClicked')(context)
      else context.get('helpers.collapse')(context)
    valueClicked: (context) ->
      if context.get('valueClicked') then context.get('valueClicked')(context)
      else context.get('helpers.collapse')(context)
  actions:
    handleLabelClicked: (context) ->
      @get('helpers.labelClicked')(@)
    handleLoadingClicked: (context) ->
      @get('helpers.loadingClicked')(@)
    handleValueClicked: (context) ->
      @get('helpers.valueClicked')(@)
    handleHideTitle: ->
      @set('hideTitle', true)
    handleHideHeadings: ->
      @set('hideHeadings', true)
    saveChanges: ->
      if @get('bubbleSaveChanges') then sendAction('saveChanges', @get('object'))
      else @get('object')?.save()

`export default ObjectDisplayComponent`
