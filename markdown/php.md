# PHP

```php
    use AsyncTcp;

    $tcp = new AsyncTcp('127.0.0.1', 9501);
    $tcp->setTimeout(2);
    //串行发送
    $res = (yield $tcp->call('hello server!'));
    $res = (yield $tcp->call('hello server!'));

    //并行发送数据包
    $tcp->addCall('hello server1!');
    $tcp->addCall('hello server2!');
    $res = (yield $tcp->multiCall());
```
