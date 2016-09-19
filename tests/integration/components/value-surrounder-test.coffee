`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'value-surrounder', 'Integration | Component | value surrounder', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{value-surrounder}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#value-surrounder}}
      template block text
    {{/value-surrounder}}
  """

  assert.equal @$().text().trim(), 'template block text'
