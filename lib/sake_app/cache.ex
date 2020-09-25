defmodule SakeApp.Cache do
  def put(%{key: key, val: value}) do
    Cachex.put(:sake_app_cache, key, value)
  end
  
  def get(key) do
    Cachex.get(:sake_app_cache, key)
  end
end
