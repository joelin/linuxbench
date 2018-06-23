# linux 服务器 benchmark 测试及收集

本工具包含 `sosreport` `fio` `unixbench` 的运行及结果收集，使用 `ansible` 运行及收集结果

由于运行任务时间较长，所有任务全部封装为 shell 文件在服务后台运行。

## 配置

需要配置的 `vars.yml` 指定工作路径和推送的脚本路径

```yml
result_dir: /tmp/benchresult2/              #运行结果存放路径
collection_dir: /tmp/collections2/          #主控节点归集结果的路径
work_dir: /tmp/benchtool/                   #工具推送的路径
```

需要配置的ansible hosts 文件，指定大数据的 ip

```ini
[bigdata]
192.168.33.111
```

## 运行

本工具封装为 2 个 playbook， 一个为 `playbook/benchmark.yml`,一个为 `playbook/collections.yml` 数据收集。

### benchmark 单步运行

```shell
# 仅初始化工具及目录
ansible-playbook -i hosts playbook/benchmark.yml -t init  
# 运行 sosreport
ansible-playbook -i hosts playbook/benchmark.yml -t sosreport
# 运行 fio
ansible-playbook -i hosts playbook/benchmark.yml -t fio
# 运行 unixbench
ansible-playbook -i hosts playbook/benchmark.yml -t unixbench

```

### benchmark 一次运行

```shell
# 仅初始化工具及目录
ansible-playbook -i hosts playbook/benchmark.yml -t init  
# 运行 benmark
ansible-playbook -i hosts playbook/benchmark.yml -t benchmark
```

## 收集运行结果

```shell
# 仅初始化工具及目录
ansible-playbook -i hosts playbook/collections.yml
```