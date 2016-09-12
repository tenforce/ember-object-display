`import Ember from 'ember'`

AttributesGetterMixin = Ember.Mixin.create
  setAttributes: () ->
    if @get('doNotSetAttributes')
      return false
    if @get('log') then console.log("<-- IN set attributes -->")
    if @get('chosenTagName') or @get('chosenTagName') is '' then @set 'tagName', @get('chosenTagName')
    if @get('chosenClassNames') then @set('classNames', @get('classNames').concat(@get('chosenClassNames')))
    if @get('chosenClassNameBindings') then @set('classNameBindings', @get('classNameBindings').concat(@get('chosenClassNameBindings')))
    if @get('chosenElementId') then @set 'elementId', @get('chosenElementId')
    if @get('chosenName') then @get('attributeBindings').push('chosenName:name')
    if @get('chosenTooltip') then @get('attributeBindings').push('chosenTooltip:title')
    if @get('log') then console.log("<-- OUT set attributes -->")
  # Get the tagName if specified, otherwise a default value if it exists in the component, otherwise empty string #
  chosenTagName: Ember.computed 'model.attributes.tagName', ->
    if @get('model.attributes.tagName') or @get('model.attributes.tagName') is '' then return @get 'model.attributes.tagName'
    else if @get 'defaultTagName' then return @get 'defaultTagName'
    else return ''
  # Get the classNames  if specified, otherwise a default value if it exists in the component, otherwise empty array #
  chosenClassNames: Ember.computed 'model.attributes.classNames', ->
    if @get 'model.attributes.classNames' then return @get 'model.attributes.classNames'
    else if @get 'defaultClassNames' then return @get 'defaultClassNames'
    else return ['']
  # Get the classNameBindings if specified, otherwise a default value if it exists in the component, otherwise empty array #
  chosenClassNameBindings: Ember.computed 'model.attributes.classNameBindings', ->
    if @get 'model.attributes.classNameBindings' then return @get 'model.attributes.classNameBindings'
    else if @get 'defaultClassNameBindings' then return @get 'defaultClassNameBindings'
    else return ['']
  # Get the id if specified, otherwise undefined #
  chosenElementId: Ember.computed 'model.attributes.id', ->
    if @get 'model.attributes.id' then return @get 'model.attributes.id'
    else return undefined
  # Get the name if specified, otherwise undefined #
  chosenName: Ember.computed 'model.attributes.name', ->
    if @get 'model.attributes.name' then return @get 'model.attributes.name'
    else return undefined
  # Get the tooltip if specified, otherwise undefined #
  chosenTooltip: Ember.computed 'model.attributes.tooltip', ->
    if @get 'model.attributes.tooltip' then return @get 'model.attributes.tooltip'
    else return undefined

`export default AttributesGetterMixin`
