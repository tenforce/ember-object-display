`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'value-display', 'Integration | Component | value display', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{value-display}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#value-display}}
      template block text
    {{/value-display}}
  """

  assert.equal @$().text().trim(), 'template block text'
