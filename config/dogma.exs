use Mix.Config

config :dogma,
  rule_set: Dogma.RuleSet.All,
  exclude: [
    ~r(\Aexamples/),
  ],
  override: [
    %Dogma.Rule.FunctionName{ enabled: false }
  ]
