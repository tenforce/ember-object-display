`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'object-display', 'Integration | Component | object display', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{object-display}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#object-display}}
      template block text
    {{/object-display}}
  """

  assert.equal @$().text().trim(), 'template block text'
