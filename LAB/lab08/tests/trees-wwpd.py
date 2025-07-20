test = {
  'name': 'Trees',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> t = Tree(1, Tree(2)) # Enter Function if you believe the answer is <function ...>, Error if it errors, and Nothing if nothing is displayed.
          Error
          >>> t = Tree(1, [Tree(2)])
          >>> t.label
          1
          >>> t.branches[0]
          Tree(2)
          >>> t.branches[0].label
          2
          >>> t.label = t.branches[0].label
          >>> t
          5e080e913b6f77de6e11e4e42d604b53
          # locked
          >>> t.branches.append(Tree(4, [Tree(8)]))
          >>> len(t.branches)
          9338923f09aac77121029c604f7ce4f3
          # locked
          >>> t.branches[0]
          bfa3de0173e91cf58f909e29f02563ca
          # locked
          >>> t.branches[1]
          a860e3bafdfaffbf7978aa099acbfc9b
          # locked
          """,
          'hidden': False,
          'locked': True,
          'multiline': False
        }
      ],
      'scored': False,
      'type': 'wwpp'
    }
  ]
}
