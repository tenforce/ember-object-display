`import Ember from 'ember'`
`import layout from '../templates/components/headings-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

HeadingsDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  # DEPRECATED
  layout:layout
  defaultTagName: 'div'
  defaultClassNames: ['headings-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false

  arrayLength: Ember.computed 'object', 'model.values.length', ->
    @get('model.values.length')

  emptyHeadings: 0
  cleanState: () ->
    @set('emptyHeadings', 0)

  checkEmptyHeadings: Ember.observer('object', 'arrayLength', 'emptyHeadings', () ->
    if @get('arrayLength') is @get('emptyHeadings') then @set('empty', true)
  ).on('init')

  actions:
    handleHideHeading: (context, index) ->
      context.set('model._shouldHide', true)
      @incrementProperty('emptyHeadings')

`export default HeadingsDisplayComponent`
