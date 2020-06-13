# The future is now: Kubernetes Operators


<img src="/.docs/img/bolt.png"  alt="" style="width:100px;">


# Steps

1. You need a working helm chart

## Create operator from Helm.

```bash
operator-sdk new timeMachine --type=helm --helm-chart=mychart  --kind=TimeMachine
```

```bash
new: name of the Operator Folder
--type: Helm/Ansible/Go
--helm-chart: location of your chart (URL, or localPath)
--kind: the Name of your CR.
```

## Build your operator image

```bash
operator-sdk build mcano/timemachine-operator:1.0
```
> remember that an operator will run as a first class citizen inside your cluster, that is why you need an image.

## Edit Image
Edit `deploy/operator.yaml`

## Deploy CRD

```bash
kubectl apply -f deploy/crds/helm.operator-sdk_timemachines_crd.yaml 
```

> K8 needs to know about your CustomResource so that your Operator can "Control" your CRD

## Deploy Operator and required resources
```bash
kubectl -f deploy/
```

Deploys:
- **(Role & RoleBinding).yaml:** because your operator needs to have RBAC in order to talk to k8 api-server
- **ServiceAccount.yaml:** A service account to link the RoleBinding
- **operator.yaml**: The operator Deployment.

### (Optinally) Run operator locally

We can run the Operator locally so that we can check reconcilliation loop.

```bash
operator-sdk run local --reconcile-period="2s"
```

## Deploy your new TimeMachine!!

```bash
vim deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml

kubectl apply -f deploy/crds/helm.operator-sdk_v1alpha1_timemachine_cr.yaml

kubectl get timemachines

```

## BTTF Important Dates:

- "October 21, 2015"
- "October 26, 1985"
- "November 5, 1955"