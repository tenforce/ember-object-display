`import Ember from 'ember'`
`import layout from '../templates/components/headings-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

HeadingsDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout

  arrayLength: Ember.computed 'object', 'model.values.length', ->
    @get('model.values.length')
  emptyHeadings: 0

  checkEmptyHeadings: Ember.observer('object', 'arrayLength', 'emptyHeadings', () ->
    if @get('arrayLength') is @get('emptyHeadings') then @set('empty', true)
  ).on('init')

  actions:
    handleHideHeading: (context, index) ->
      #debugger
      context.set('model._shouldHide', true)
      @incrementProperty('emptyHeadings')

`export default HeadingsDisplayComponent`
