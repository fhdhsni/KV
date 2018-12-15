defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "deletes the given key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "apple", 8)

    KV.Bucket.delete(bucket, "apple")
    assert KV.Bucket.get(bucket, "apple") == nil
  end
end
