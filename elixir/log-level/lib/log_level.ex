defmodule LogLevel do
  def to_label(level, legacy?) do
    merged = {level, legacy?}

    cond do
      {0, false} == merged -> :trace
      {1, true} == merged -> :debug
      {1, false} == merged -> :debug
      {2, true} == merged -> :info
      {2, false} == merged -> :info
      {3, true} == merged -> :warning
      {3, false} == merged -> :warning
      {4, true} == merged -> :error
      {4, false} == merged -> :error
      {5, false} == merged -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    merged = {to_label(level, legacy?), legacy?}

    cond do
      {:error, true} == merged -> :ops
      {:error, false} == merged -> :ops
      {:fatal, false} == merged -> :ops
      {:unknown, true} == merged -> :dev1
      {:unknown, false} == merged -> :dev2
      true -> false
    end
  end
end
