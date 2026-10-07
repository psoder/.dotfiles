local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  ls.snippet(
    { trig = 'sfor', name = 'Solid For loop' },
    fmt(
      [[
<For each={{{}}}>
  {{{} => (
    {}
  )}}
</For>
]],
      {
        ls.insert_node(1, 'items'),
        ls.insert_node(2, 'item'),
        ls.insert_node(3, '<div />'),
      }
    )
  ),

  ls.snippet({ trig = 'tag', name = 'JSX element with matching tags' }, {
    ls.text_node '<',
    ls.insert_node(1, 'div'),
    ls.text_node { '>', '  ' },
    ls.insert_node(2),
    ls.text_node { '', '</' },
    rep(1),
    ls.text_node '>',
  }),

  ls.snippet({ trig = 'div', name = 'JSX div element' }, {
    ls.text_node { '<div>', '  ' },
    ls.insert_node(1),
    ls.text_node { '', '</div>' },
  }),

  ls.snippet({ trig = 'frag', name = 'JSX fragment' }, {
    ls.text_node { '<>', '  ' },
    ls.insert_node(1),
    ls.text_node { '', '</>' },
  }),

  ls.snippet(
    { trig = 'scomp', name = 'Solid component without props' },
    fmt(
      [[
export const {} = () => {{
  return <{}>{}</{}>;
}};
]],
      {
        ls.insert_node(1, 'Component'),
        ls.insert_node(2, 'div'),
        ls.insert_node(3),
        rep(2),
      }
    )
  ),

  ls.snippet(
    { trig = 'scompt', name = 'Solid component with props interface' },
    fmt(
      [[
interface {}Props {{
  {};
}}

export const {} = (props: {}Props) => {{
  return <{}>{}</{}>;
}};
]],
      {
        ls.insert_node(1, 'Component'),
        ls.insert_node(2, 'title: string'),
        rep(1),
        rep(1),
        ls.insert_node(3, 'div'),
        ls.insert_node(4, '{props.title}'),
        rep(3),
      }
    )
  ),
}
