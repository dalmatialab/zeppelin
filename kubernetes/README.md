# Zeppelin

This repo contains Zeppelin Helm chart for deploying on Kubernetes.

## Installation

Nodes where Zeppelin needs to be deployed must be labeled. There is only one label named `zeppelin`. To label node use:

    $ kubectl label nodes node-list zeppelin=true 

Where:

 - `node-list` are nodes to label

To disable node selector just set `nodeselector` in `values.yaml` to `false`.  
Before installation fill `values.yaml` and to install Helm chart run:

    $ helm install some-chart-name --namespace=some-namespace-name --create-namespace path-to-chart-directory

Where:

- `some-chart-name` is Helm chart name
- `some-namespace-name` is optional argument that defines Kubernetes and Helm namespace where chart will be installed
- `path-to-chart-directory` is chart directory

## Values

Possible values to configure inside `values.yaml` are: 

 - `image` - defines Zookeeper image name
 - `imageTag` - defines Zookeeper image tag
 - `replicas` - defines number of Pods (integer)
 - `serviceName` - defines Kubernetes service name for component
 - `nodeSelector` - defines node selector usage (boolean) and possible values are `true` and `false`
 - `nodePort` - defines service port where service can be accessed outside cluster

`Storage section` enables using costum volume mounts. To use it set `subsection enabled` to `true` and fill `volumeMounts` and `volumes` fields according to Kubernetes documentation.

`Spark section` defines `executorMemory`, `executorCores` and `coresMax` values for spark workers. More about them read in spark [documentation](https://spark.apache.org/docs/latest/configuration.html). Last value is `master` that define spark-master instance.

## Uninstallation

To full uninstall run:

    $ helm del some-chart-name -n some-namespace-name

Where:

- `some-chart-name` is Helm chart name for uninstall.
- `some-namespace-name` is optional argument that defines Helm namespace where chart is installed.
