EMBER-OBJECT-DISPLAY
____________________

Remaining work:
- Finish handling loading and hide for multivalued types
- Allow simple modification
- Use a generic type of action handling, where the first parameter would be the real action name
- Remove "loading" from properties, should only be used on item level
- Add the list of helpers functions and their default implementation
---------------


Ember-object-display is an addon that can be used to render the different properties of an object, usually a model object but it might just work with any kind of object.
The configuration needed by this addon is a JSON object, divided in different parts.
Those different parts are: 

For the object displayer:
- An optional main title, of the <ITEM> type
- A list of HEADINGS
For the heading:
- An optional heading title, of the <ITEM> type
- A list of ITEMS
For the item:
- An optional label, of the <VALUE> type
- An optional loading component, of the <VALUE> type, if none is provided, a default one is used, just displaying "Loading..." (overriding this one should be possible)
- A target, the value we want to display, of the <VALUE> type
For the value:
- A type, which must be in ['string', 'property', 'array', 'component', 'hasOne', 'hasMany']
	* String : a simple hardcoded string which value is set in the "value" field.
	* Property: a property belonging to the object that is not an array or a relation, the name of that property is set in the "value" field.
	* Array: a type of property that is multivalued. Its name is set in the "value" field.
	* hasOne: a relation to a single object, you also need to specify the name of the property of the linked object you want to display (let's say the object injected into the addon is a person, the hasOne relationship is his/her companion and you want to display the companion's name, you'd need to specify the name of that relationship in the "value" field and the name of the property in "relation.value" field)
	* hasMany: a relation to multiple objects, you also need to specify the name of the property of the linked object you want to display (if our object is an album, you could display all the songs' name).
	* Component: if something complex needs to be displayed, or if the component already exists, you can specify a component name in the "value" field, it will receive the object, the JSON item related to it and the helpers propagated through all the children of the addon. Please note that you can still interact with the addon through the "clicked", "handleHide" and "handleFinishedLoading" actions.
	* Item: experimental, mainly used to nest tags inside other tags.
- A value: See above.
- A prefix: Of the <VALUE> type, to be displayed in front of the actual value. In a multivalue case, the prefix will be repeated before each of the values.
- A suffix: Of the <VALUE> type, to be displayed after the actual value. In a multivalue case, the suffix will be repeated after each of the values.
- An item object: Only used when the type of the value is either "array" or "hasMany", defines the attributes / properties / helpers of each item in the list.
- A container object: Only used when the type of the valie is either "array" or "hasMany", defines the attributes / properties / helpers of the list.

Moreover, nearly each of those parts can customizable through different parameters.
- Attributes: Define the HTML attributes used for this part.
	* TagName: the HTML tag used to render the part, can be set to '' to make it an empty one (do not that this prevents handling the "clicked" event though). If none have been provided, a default will be used for the current part (usually "div")
	* ClassNames: the classes used to describe this part, they do not overwrite the existing ones but are appended. Overriding them would have meant losing the clicked event
	* ClassNameBindings: used to specify a class depending on another property. Ex : ["isCollapsed:collapsed:open"] checks wether the "isCollapsed" property is true. If it is, the class will be "collapsed", otherwise it will be "open".
	* Tooltip: set a "title" attribute to the part, displaying a tooltip on mouseover.
	* Name: set a name" attribute to the part
- Properties: Define different properties for this part
	* showEmpty: sends an action "handleHide" if this boolean isn't set to true and the value is undefined or empty
	* collapsible: used to decide wether this part is collapsible or not.
	* collapsed: specify whether this part starts collapsed or open
	* modifiable: <<NOT IMPLEMENTED YET>> specify whether this part is modifiable
	* hide: specify whether this part should be hidden
	* parameters: this is where you should specify anything additional that your custom components might need
- Helpers: Different functions that gets propagated from top level to bottom ones. If a node overrides one of the helpers, the children get affected but not the elder nodes. Some of the default actions get handled through default helpers (clicked, handleHide, handleFinishedLoading).


<<-- TODO : COMPLETE -->>


testObject:
    attributes:
      tagName: 'div'
      classNames: ['no mountain']
      classNameBindings: ['helpers.high:high_enough:low_enough', 'collapsed:collapsed:open']
      tooltip: 'this is a tooltip'
    properties:
      showEmpty: true
      collapsible: true
      collapsed: false
      modifiable: true
      hide: true
      parameters:
        test1: "test1"
        test2: "test2"
    helpers:
      high: () ->
        return true
      low: () ->
        return true
      ###collapse: () ->
        console.log "viva la vida"
        return false###
    title:
      attributes:
        tagName: 'div'
        classNames: ['ping', 'pong']
        classNameBindings: ['helpers.low:low_enough:high_enough', 'collapsed:collapsed:open']
      label:
        type: 'string'
        value: 'Label'
        attributes:
          tagName: 'span'
          classNames: ['label for title']
      target:
        attributes:
          tagName: 'span'
        type: 'property'
        value: 'defaultPrefLabel'
        prefix:
          type: 'string'
          value: 'prefix'
          attributes:
            tagName: 'h1'
        suffix:
          type: 'string'
          value: 'suffix'
          attributes:
            tagName: 'h3'
    headings:
      attributes:
        tagName: 'ul'
        classNames: ['headings']
        tooltip: '<<HEADINGS>>'
      values:
        [
          {
            attributes:
              tagName: 'li'
              classNames: ['heading1']
              tooltip: '<<HEADING1>>'
            title:
              target:
                type: 'string'
                value: 'heading2 title'
            items:
              attributes:
                tagName: 'div'
                classNames: ['items']
                tooltip: '<<ITEMS>>'
              values:
                [
                  {
                    attributes:
                      tagName: 'div'
                      classNames: ['item1']
                      tooltip: '<<ITEM1>>'
                    label:
                      type: 'string'
                      value: 'test component'
                    target:
                      type: 'component'
                      value: 'loading-default'
                  },
                  {
                    loading:
                      type: 'string'
                      value: 'array is loading'
                    label:
                      type: 'string'
                      value: 'Array'
                    target:
                      type: 'array'
                      value: 'languagePreference'
                      container:
                        attributes:
                          tagName: 'ul'
                      member:
                        attributes:
                          tagName: 'li'
                      item:
                        attributes:
                          tagName: 'span'
                        prefix:
                          attributes:
                            tagName: 'h1'
                          type: 'string'
                          value: 'BEFORE'
                        suffix:
                          attributes:
                            tagName: 'h2'
                          type: 'string'
                          value: 'AFTER'
                  }
                ]
          },
          {
            attributes:
              tagName: 'li'
              classNames: ['heading2']
              tooltip: '<<HEADING2>>'
            title:
              target:
                type: 'string'
                value: 'heading2 title'
            items:
              attributes:
                tagName: 'div'
                classNames: ['items']
                tooltip: '<<ITEMS>>'
              values:
                [
                  {
                    target:
                      type: 'hasMany'
                      value: 'broader'
                      container:
                        attributes:
                          tagName: 'ul'
                      member:
                        attributes:
                          tagName: 'li'
                      relation:
                        prefix:
                          attributes:
                            tagName: 'prelevel2'
                          type: 'string'
                          value: 'prelevel2'
                        suffix:
                          attributes:
                            tagName: 'suflevel2'
                          type: 'string'
                          value: 'suflevel2'
                        type: 'property'
                        value: 'defaultPrefLabel'
                  }
                ]
          }
        ]