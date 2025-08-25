defmodule LogLevel do
  @unsupported_legacy_levels [0, 5]

  def to_label(level, legacy?) do
    cond do
      legacy? and level in @unsupported_legacy_levels ->
        :unknown
      level == 0 ->
        :trace
      level == 1 ->
        :debug
      level == 2 ->
        :info
      level == 3 ->
        :warning
      level == 4 ->
        :error
      level == 5 ->
        :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    with log_label <- to_label(level, legacy?) do
      cond do
        log_label == :error or log_label == :fatal ->
          :ops
        log_label == :unknown and legacy? ->
          :dev1
        log_label == :unknown ->
          :dev2
        true -> false
      end
    end
  end
end
